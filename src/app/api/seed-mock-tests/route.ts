// ONE-TIME seed route — inserts/updates mock_test rows with accurate section configs.
// Hit GET /api/seed-mock-tests once to populate the DB, then delete this file.
// Uses the service-role key via server Supabase client so it bypasses RLS.

import { createClient } from "@/lib/supabase/server";
import { NextResponse } from "next/server";

const MOCK_TESTS = [
  {
    collegeSlug: "up",
    name: "UPCAT Full Mock Test",
    time_limit_minutes: 200,
    section_config: [
      { subject_id: null, name: "Language Proficiency",    minutes: 45, question_count: 80 },
      { subject_id: null, name: "Science Proficiency",     minutes: 40, question_count: 45 },
      { subject_id: null, name: "Mathematics Proficiency", minutes: 55, question_count: 45 },
      { subject_id: null, name: "Reading Comprehension",   minutes: 60, question_count: 80 },
    ],
  },
  {
    collegeSlug: "admu",
    name: "ACET Full Mock Test",
    time_limit_minutes: 185,
    section_config: [
      { subject_id: null, name: "English Proficiency",     minutes: 40, question_count: 75 },
      { subject_id: null, name: "Mathematics Proficiency", minutes: 60, question_count: 60 },
      { subject_id: null, name: "Abstract Reasoning",      minutes: 10, question_count: 30 },
      { subject_id: null, name: "Reading Comprehension",   minutes: 25, question_count: 30 },
      { subject_id: null, name: "Verbal Analogy",          minutes:  5, question_count: 25 },
      { subject_id: null, name: "Logical Reasoning",       minutes: 15, question_count: 30 },
      { subject_id: null, name: "Numerical Ability",       minutes: 30, question_count: 30 },
    ],
  },
  {
    collegeSlug: "dlsu",
    name: "DCAT Full Mock Test",
    time_limit_minutes: 240,
    section_config: [
      { subject_id: null, name: "Mental Ability",            minutes: 40, question_count: 40 },
      { subject_id: null, name: "Writing Skills & Language", minutes: 30, question_count: 40 },
      { subject_id: null, name: "Mathematics Proficiency",   minutes: 50, question_count: 45 },
      { subject_id: null, name: "Science Proficiency",       minutes: 50, question_count: 50 },
      { subject_id: null, name: "Reading Comprehension",     minutes: 30, question_count: 30 },
      { subject_id: null, name: "Statistics & Probability",  minutes: 40, question_count: 45 },
    ],
  },
  {
    collegeSlug: "ust",
    name: "USTET Full Mock Test",
    time_limit_minutes: 165,
    section_config: [
      { subject_id: null, name: "Mental Ability",          minutes: 30, question_count: 80 },
      { subject_id: null, name: "English Proficiency",     minutes: 45, question_count: 80 },
      { subject_id: null, name: "Mathematics Proficiency", minutes: 45, question_count: 60 },
      { subject_id: null, name: "Science Proficiency",     minutes: 45, question_count: 80 },
    ],
  },
];

export async function GET() {
  const supabase = await createClient();
  const results: Record<string, string> = {};

  for (const test of MOCK_TESTS) {
    // Get college id
    const { data: college, error: collegeErr } = await supabase
      .from("colleges")
      .select("id")
      .eq("slug", test.collegeSlug)
      .single();

    if (collegeErr || !college) {
      results[test.collegeSlug] = `ERROR: college not found`;
      continue;
    }

    // Upsert: delete existing then insert fresh
    await supabase.from("mock_tests").delete().eq("college_id", college.id);

    const { error: insertErr } = await supabase.from("mock_tests").insert({
      college_id: college.id,
      name: test.name,
      time_limit_minutes: test.time_limit_minutes,
      section_config: test.section_config,
    });

    results[test.collegeSlug] = insertErr ? `ERROR: ${insertErr.message}` : "OK";
  }

  return NextResponse.json({ results });
}
