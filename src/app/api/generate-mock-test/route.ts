import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { PDFParse } from "pdf-parse";
import { createWorker } from "tesseract.js";

export async function POST(request: NextRequest) {
  try {
    const supabase = await createClient();
    
    // Check authentication
    const { data: userData, error: userError } = await supabase.auth.getUser();
    if (userError || !userData.user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const formData = await request.formData();
    const file = formData.get("file") as File | null;
    const collegeName = formData.get("collegeName") as string;
    const examName = formData.get("examName") as string;

    if (!file || !collegeName || !examName) {
      return NextResponse.json(
        { error: "Missing required fields: file, collegeName, examName" },
        { status: 400 }
      );
    }

    // Extract text from file
    const fileBuffer = Buffer.from(await file.arrayBuffer());
    let extractedText = "";
    
    if (file.type === "application/pdf") {
      // Parse PDF using PDFParse v2 class API
      const parser = new PDFParse({ data: fileBuffer });
      const textResult = await parser.getText();
      extractedText = textResult.text;
      await parser.destroy();
    } else if (file.type.startsWith("image/")) {
      // OCR for images
      const worker = await createWorker("eng");
      const { data: { text } } = await worker.recognize(fileBuffer);
      await worker.terminate();
      extractedText = text;
    } else {
      return NextResponse.json(
        { error: "Unsupported file type. Please upload a PDF or image file." },
        { status: 400 }
      );
    }

    if (!extractedText || extractedText.trim().length < 50) {
      return NextResponse.json(
        { error: "Could not extract enough text from the file. Please check the file quality." },
        { status: 400 }
      );
    }

    // Optionally upload file to Supabase Storage (non-blocking — skip if bucket not set up)
    let filePath: string | null = null;
    try {
      const fileExt = file.name.split(".").pop();
      const fileName = `${userData.user.id}/${Date.now()}.${fileExt}`;
      const { data: uploadData, error: uploadError } = await supabase.storage
        .from("mock-test-uploads")
        .upload(fileName, fileBuffer, { contentType: file.type, upsert: false });
      if (!uploadError && uploadData) filePath = uploadData.path;
    } catch {
      // Storage bucket may not be set up yet — continue without it
    }

    // Use Quiick agent to extract structured questions
    if (!process.env.QUIICK_AGENT_URL) {
      console.error("QUIICK_AGENT_URL is not set");
      return NextResponse.json(
        { error: "AI processing is not configured. Please add QUIICK_AGENT_URL to .env.local" },
        { status: 500 }
      );
    }

    const agentResponse = await fetch(process.env.QUIICK_AGENT_URL, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        ...(process.env.QUIICK_API_KEY && { "Authorization": `Bearer ${process.env.QUIICK_API_KEY}` }),
      },
      body: JSON.stringify({
        message: `Extract questions from this exam document text. Return valid JSON with this structure:
{
  "subjects": [{"name": "Subject Name", "slug": "subject-slug", "description": "Brief description"}],
  "questions": [{
    "subject_slug": "subject-slug",
    "topic": "Topic name",
    "prompt": "Question text",
    "choices": [{"key": "A", "text": "Option A"}, {"key": "B", "text": "Option B"}, {"key": "C", "text": "Option C"}, {"key": "D", "text": "Option D"}],
    "correct_answer": "A",
    "explanation": "Explanation text or null",
    "difficulty": "easy|medium|hard"
  }]
}

Document text:
${extractedText}`,
      }),
    });

    if (!agentResponse.ok) {
      const errorText = await agentResponse.text();
      console.error("Quiick agent error:", errorText);
      return NextResponse.json(
        { error: "Failed to process document with AI agent" },
        { status: 500 }
      );
    }

    const agentResult = await agentResponse.json();
    
    // Extract the structured data from agent response
    // Adjust this based on your Quiick agent's actual response format
    let parsedData;
    if (agentResult.response) {
      // If agent returns { response: "..." } with JSON string
      const jsonMatch = agentResult.response.match(/```(?:json)?\s*\n?([\s\S]*?)\n?```/) || agentResult.response.match(/\{[\s\S]*\}/);
      const jsonText = jsonMatch ? (jsonMatch[1] || jsonMatch[0]) : agentResult.response;
      parsedData = JSON.parse(jsonText.trim());
    } else if (agentResult.subjects && agentResult.questions) {
      // If agent already returns structured JSON
      parsedData = agentResult;
    } else {
      console.error("Unexpected agent response format:", agentResult);
      return NextResponse.json(
        { error: "Received unexpected format from AI agent" },
        { status: 500 }
      );
    }

    // Create the college
    const slug = `${collegeName}-${Date.now()}`
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-+|-+$/g, "");
    
    const { data: college, error: collegeError } = await supabase
      .from("colleges")
      .insert({
        slug,
        name: collegeName,
        exam_name: examName,
        description: `Generated from uploaded file: ${file.name}`,
        is_custom: true,
        owner_id: userData.user.id,
      })
      .select()
      .single();

    if (collegeError || !college) {
      return NextResponse.json(
        { error: "Failed to create college entry" },
        { status: 500 }
      );
    }

    // Create subjects
    const subjectMap = new Map<string, string>();
    
    for (const [index, subject] of parsedData.subjects.entries()) {
      const { data: subjectData, error: subjectError } = await supabase
        .from("subjects")
        .insert({
          college_id: college.id,
          slug: subject.slug,
          name: subject.name,
          description: subject.description || null,
          sort_order: index,
        })
        .select()
        .single();

      if (!subjectError && subjectData) {
        subjectMap.set(subject.slug, subjectData.id);
      }
    }

    // Create questions
    let insertedCount = 0;
    for (const question of parsedData.questions) {
      const subjectId = subjectMap.get(question.subject_slug);
      if (!subjectId) continue;

      const { error: questionError } = await supabase.from("questions").insert({
        subject_id: subjectId,
        topic: question.topic,
        prompt: question.prompt,
        choices: question.choices,
        correct_answer: question.correct_answer || "A", // default to A if not provided
        explanation: question.explanation || null,
        difficulty: question.difficulty || "medium",
        source: file.name,
        is_ai_generated: true,
      });

      if (!questionError) insertedCount++;
    }

    return NextResponse.json({
      success: true,
      collegeSlug: college.slug,
      subjectsCreated: parsedData.subjects.length,
      questionsCreated: insertedCount,
      fileUrl: filePath,
    });

  } catch (error) {
    console.error("Error processing file:", error);
    if (error instanceof Error) {
      console.error("Error stack:", error.stack);
    }
    return NextResponse.json(
      { error: error instanceof Error ? error.message : "Failed to process file" },
      { status: 500 }
    );
  }
}
