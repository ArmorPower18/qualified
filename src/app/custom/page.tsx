"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Upload, FileText, Image as ImageIcon } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { createClient } from "@/lib/supabase/client";

export default function CustomCetPage() {
  const router = useRouter();
  const supabase = createClient();
  const [name, setName] = useState("");
  const [examName, setExamName] = useState("");
  const [coverage, setCoverage] = useState("");
  const [sampleQuestions, setSampleQuestions] = useState("");
  const [file, setFile] = useState<File | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [progress, setProgress] = useState<string>("");

  async function handleManualSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setError(null);

    const { data: userData } = await supabase.auth.getUser();
    if (!userData.user) {
      setLoading(false);
      router.push("/login");
      return;
    }

    const slug = `${name}-${Date.now()}`.toLowerCase().replace(/[^a-z0-9]+/g, "-");
    const { data: college, error: insertError } = await supabase
      .from("colleges")
      .insert({
        slug,
        name,
        exam_name: examName,
        description: `Custom reviewer. Coverage:\n${coverage}\n\nSample questions:\n${sampleQuestions}`,
        is_custom: true,
        owner_id: userData.user.id,
      })
      .select()
      .single();

    setLoading(false);
    if (insertError || !college) {
      setError(insertError?.message ?? "Something went wrong. Please try again.");
      return;
    }
    router.push(`/colleges/${college.slug}`);
  }

  async function handleFileSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setError(null);
    setProgress("Checking authentication...");

    const { data: userData } = await supabase.auth.getUser();
    if (!userData.user) {
      setLoading(false);
      router.push("/login");
      return;
    }

    if (!file) {
      setError("Please select a file to upload");
      setLoading(false);
      return;
    }

    try {
      setProgress("Uploading file...");
      const formData = new FormData();
      formData.append("file", file);
      formData.append("collegeName", name);
      formData.append("examName", examName);

      setProgress("Extracting text from file...");
      const response = await fetch("/api/generate-mock-test", {
        method: "POST",
        body: formData,
      });

      const result = await response.json();

      if (!response.ok) {
        setError(result.error || "Failed to process file");
        setLoading(false);
        return;
      }

      setProgress("Mock test created successfully!");
      setTimeout(() => {
        router.push(`/colleges/${result.collegeSlug}`);
      }, 1000);
    } catch (err) {
      setError(err instanceof Error ? err.message : "An unexpected error occurred");
      setLoading(false);
    }
  }

  return (
    <div className="editorial-shell max-w-3xl py-10">
      <div className="border-b border-foreground/15 pb-6">
        <p className="eyebrow">Custom exam</p>
        <h1 className="mt-3 text-4xl font-semibold leading-tight md:text-5xl">
          Prepping for a different CET?
        </h1>
        <p className="mt-3 max-w-2xl text-muted-foreground">
          Qualified works for any college entrance test. Upload a past exam or reviewer PDF/image,
          and we&apos;ll automatically generate a custom mock test for you.
        </p>
      </div>

      <Card className="studio-card mt-6">
        <CardHeader>
          <CardTitle>Create a custom reviewer</CardTitle>
          <CardDescription>Requires a free account so we can save this to your profile.</CardDescription>
        </CardHeader>
        <CardContent>
          {/* Shared fields */}
          <div className="flex flex-col gap-4 mb-6">
            <div className="flex flex-col gap-2">
              <Label htmlFor="college-name">College / University name</Label>
              <Input
                id="college-name"
                required
                placeholder="e.g. Polytechnic University of the Philippines"
                value={name}
                onChange={(e) => setName(e.target.value)}
              />
            </div>
            <div className="flex flex-col gap-2">
              <Label htmlFor="exam-name">Entrance exam name</Label>
              <Input
                id="exam-name"
                required
                placeholder="e.g. PUPCET, XU CEE"
                value={examName}
                onChange={(e) => setExamName(e.target.value)}
              />
            </div>
          </div>

          <Tabs defaultValue="upload">
            <TabsList className="w-full">
              <TabsTrigger value="upload" className="flex-1 flex items-center gap-2">
                <Upload className="h-4 w-4" />
                Upload file
              </TabsTrigger>
              <TabsTrigger value="manual" className="flex-1">
                Enter manually
              </TabsTrigger>
            </TabsList>

            {/* File upload tab */}
            <TabsContent value="upload">
              <form onSubmit={handleFileSubmit} className="flex flex-col gap-4 mt-4">
                <div className="flex flex-col gap-2">
                  <Label htmlFor="file-upload">Past exam PDF or image</Label>
                  <div
                    className={`relative flex flex-col items-center justify-center rounded-lg border-2 border-dashed px-6 py-10 text-center transition-colors ${
                      file ? "border-primary bg-primary/5" : "border-muted-foreground/30 hover:border-primary/50"
                    }`}
                  >
                    <input
                      id="file-upload"
                      type="file"
                      accept=".pdf,image/png,image/jpeg,image/jpg,image/webp"
                      className="absolute inset-0 cursor-pointer opacity-0"
                      onChange={(e) => setFile(e.target.files?.[0] ?? null)}
                    />
                    {file ? (
                      <div className="flex flex-col items-center gap-2">
                        {file.type === "application/pdf" ? (
                          <FileText className="h-10 w-10 text-primary" />
                        ) : (
                          <ImageIcon className="h-10 w-10 text-primary" />
                        )}
                        <p className="text-sm font-medium">{file.name}</p>
                        <p className="text-xs text-muted-foreground">
                          {(file.size / 1024 / 1024).toFixed(2)} MB · Click to change
                        </p>
                      </div>
                    ) : (
                      <div className="flex flex-col items-center gap-2">
                        <Upload className="h-10 w-10 text-muted-foreground/50" />
                        <p className="text-sm font-medium">Drop a file here or click to browse</p>
                        <p className="text-xs text-muted-foreground">PDF, PNG, JPG up to 20 MB</p>
                      </div>
                    )}
                  </div>
                </div>

                <div className="rounded-md bg-muted/50 px-4 py-3 text-sm text-muted-foreground">
                  <p className="font-medium text-foreground">How it works</p>
                  <ul className="mt-1 list-disc list-inside space-y-1">
                    <li>We extract text from your file using AI</li>
                    <li>Questions, choices, and answers are identified automatically</li>
                    <li>A structured mock test is created and saved to your profile</li>
                  </ul>
                </div>

                {error && <p className="text-sm text-destructive">{error}</p>}
                {progress && loading && (
                  <p className="text-sm text-primary animate-pulse">{progress}</p>
                )}

                <Button type="submit" disabled={loading || !file || !name || !examName}>
                  {loading ? progress || "Processing..." : "Generate mock test from file"}
                </Button>
              </form>
            </TabsContent>

            {/* Manual entry tab */}
            <TabsContent value="manual">
              <form onSubmit={handleManualSubmit} className="flex flex-col gap-4 mt-4">
                <div className="flex flex-col gap-2">
                  <Label htmlFor="coverage">Detailed subject coverage</Label>
                  <Textarea
                    id="coverage"
                    required
                    rows={5}
                    placeholder="List the subjects and topics covered by the exam..."
                    value={coverage}
                    onChange={(e) => setCoverage(e.target.value)}
                  />
                </div>
                <div className="flex flex-col gap-2">
                  <Label htmlFor="samples">Sample questions</Label>
                  <Textarea
                    id="samples"
                    required
                    rows={5}
                    placeholder="Paste a few sample questions (with answers, if available)..."
                    value={sampleQuestions}
                    onChange={(e) => setSampleQuestions(e.target.value)}
                  />
                </div>
                {error && <p className="text-sm text-destructive">{error}</p>}
                <Button type="submit" disabled={loading}>
                  {loading ? "Creating..." : "Create my reviewer"}
                </Button>
              </form>
            </TabsContent>
          </Tabs>
        </CardContent>
      </Card>
    </div>
  );
}
