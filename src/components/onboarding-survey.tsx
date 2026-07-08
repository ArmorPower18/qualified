"use client";

import { useState } from "react";
import { CheckIcon, ArrowRightIcon, ArrowLeftIcon, SkipForwardIcon } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
} from "@/components/ui/dialog";
import { createClient } from "@/lib/supabase/client";
import { cn } from "@/lib/utils";
import type { TargetExam, MasteryLevel, ExplanationStyle } from "@/lib/types";

const EXAMS: { value: TargetExam; label: string; sub: string }[] = [
  { value: "UPCAT", label: "UPCAT", sub: "University of the Philippines" },
  { value: "ACET", label: "ACET", sub: "Ateneo de Manila University" },
  { value: "DCAT", label: "DCAT", sub: "De La Salle University" },
  { value: "USTET", label: "USTET", sub: "University of Santo Tomas" },
];

const MASTERY_LEVELS: { value: MasteryLevel; label: string; description: string }[] = [
  { value: "beginner", label: "Beginner", description: "Still learning the basics" },
  { value: "intermediate", label: "Intermediate", description: "Comfortable but need improvement" },
  { value: "advanced", label: "Advanced", description: "Strong mastery, focusing on speed & accuracy" },
];

const EXPLANATION_STYLES: { value: ExplanationStyle; label: string }[] = [
  { value: "step-by-step", label: "Step-by-step" },
  { value: "concise", label: "Concise summary" },
  { value: "visual", label: "Visual aids" },
  { value: "examples", label: "Examples" },
  { value: "others", label: "Others (please specify)" },
];

const STUDY_TIME_OPTIONS = [
  "Less than 30 min/day",
  "30 min – 1 hour/day",
  "1 – 2 hours/day",
  "2 – 3 hours/day",
  "More than 3 hours/day",
  "A few hours per week",
];

const TOTAL_STEPS = 6;

interface SurveyState {
  targetExams: TargetExam[];
  studyTime: string;
  masteryLevel: MasteryLevel | "";
  explanationStyles: ExplanationStyle[];
  explanationOther: string;
  prioritySubjects: string;
  goals: string;
}

const defaultState: SurveyState = {
  targetExams: [],
  studyTime: "",
  masteryLevel: "",
  explanationStyles: [],
  explanationOther: "",
  prioritySubjects: "",
  goals: "",
};

function ToggleChip({
  selected,
  onClick,
  children,
  className,
}: {
  selected: boolean;
  onClick: () => void;
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={cn(
        "inline-flex items-center gap-1.5 rounded-full border px-3 py-1.5 text-sm font-medium transition-all outline-none focus-visible:ring-2 focus-visible:ring-ring/50",
        selected
          ? "border-primary bg-primary text-primary-foreground"
          : "border-border bg-background text-muted-foreground hover:border-foreground/30 hover:text-foreground",
        className
      )}
    >
      {selected && <CheckIcon className="h-3 w-3 shrink-0" />}
      {children}
    </button>
  );
}

function StepDots({ current, total }: { current: number; total: number }) {
  return (
    <div className="flex items-center gap-1.5">
      {Array.from({ length: total }).map((_, i) => (
        <span
          key={i}
          className={cn(
            "block h-1.5 rounded-full transition-all",
            i < current ? "w-4 bg-primary" : i === current ? "w-4 bg-primary" : "w-1.5 bg-muted-foreground/30"
          )}
        />
      ))}
    </div>
  );
}

export function OnboardingSurvey({
  open,
  onComplete,
}: {
  open: boolean;
  onComplete: () => void;
}) {
  const supabase = createClient();
  const [step, setStep] = useState(0);
  const [state, setState] = useState<SurveyState>(defaultState);
  const [saving, setSaving] = useState(false);

  function toggleExam(exam: TargetExam) {
    setState((s) => ({
      ...s,
      targetExams: s.targetExams.includes(exam)
        ? s.targetExams.filter((e) => e !== exam)
        : [...s.targetExams, exam],
    }));
  }

  function toggleStyle(style: ExplanationStyle) {
    setState((s) => ({
      ...s,
      explanationStyles: s.explanationStyles.includes(style)
        ? s.explanationStyles.filter((e) => e !== style)
        : [...s.explanationStyles, style],
    }));
  }

  async function handleFinish() {
    setSaving(true);
    try {
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (!user) return;

      // Upsert the survey response
      await supabase.from("onboarding_responses").upsert({
        user_id: user.id,
        target_exams: state.targetExams,
        study_time: state.studyTime || null,
        mastery_level: state.masteryLevel || null,
        explanation_styles: state.explanationStyles,
        explanation_other: state.explanationOther || null,
        priority_subjects: state.prioritySubjects || null,
        goals: state.goals || null,
        updated_at: new Date().toISOString(),
      });

      // Mark onboarding as complete on the profile
      await supabase
        .from("profiles")
        .upsert({ id: user.id, onboarding_completed: true });
    } finally {
      setSaving(false);
      onComplete();
    }
  }

  async function handleSkip() {
    setSaving(true);
    try {
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (!user) return;

      // Still mark onboarding as done so the modal doesn't re-appear.
      // No response row is created.
      await supabase
        .from("profiles")
        .upsert({ id: user.id, onboarding_completed: true });
    } finally {
      setSaving(false);
      onComplete();
    }
  }

  const canProceed = (() => {
    if (step === 0) return true; // exams are optional
    if (step === 1) return true; // study time optional
    if (step === 2) return true; // mastery level optional
    if (step === 3) return true; // explanation style optional
    return true;
  })();

  const steps = [
    // Step 0 — Exams
    <div key="exams" className="flex flex-col gap-4">
      <DialogHeader>
        <p className="eyebrow">Question 1 of {TOTAL_STEPS}</p>
        <DialogTitle className="mt-2 text-lg leading-snug">
          Which exam(s) are you preparing for?
        </DialogTitle>
        <DialogDescription>Select all that apply.</DialogDescription>
      </DialogHeader>
      <div className="grid gap-2">
        {EXAMS.map((exam) => (
          <button
            key={exam.value}
            type="button"
            onClick={() => toggleExam(exam.value)}
            className={cn(
              "flex w-full items-center justify-between rounded-lg border px-4 py-3 text-left text-sm transition-all outline-none focus-visible:ring-2 focus-visible:ring-ring/50",
              state.targetExams.includes(exam.value)
                ? "border-primary bg-primary/5 text-foreground"
                : "border-border bg-background text-muted-foreground hover:border-foreground/30 hover:text-foreground"
            )}
          >
            <div>
              <p className="font-semibold text-foreground">{exam.label}</p>
              <p className="text-xs text-muted-foreground">{exam.sub}</p>
            </div>
            {state.targetExams.includes(exam.value) && (
              <span className="flex h-5 w-5 items-center justify-center rounded-full bg-primary text-primary-foreground">
                <CheckIcon className="h-3 w-3" />
              </span>
            )}
          </button>
        ))}
      </div>
    </div>,

    // Step 1 — Study time
    <div key="studytime" className="flex flex-col gap-4">
      <DialogHeader>
        <p className="eyebrow">Question 2 of {TOTAL_STEPS}</p>
        <DialogTitle className="mt-2 text-lg leading-snug">
          How much study time do you have?
        </DialogTitle>
        <DialogDescription>
          On average, per day or week — pick the closest option.
        </DialogDescription>
      </DialogHeader>
      <div className="flex flex-wrap gap-2">
        {STUDY_TIME_OPTIONS.map((opt) => (
          <ToggleChip
            key={opt}
            selected={state.studyTime === opt}
            onClick={() => setState((s) => ({ ...s, studyTime: s.studyTime === opt ? "" : opt }))}
          >
            {opt}
          </ToggleChip>
        ))}
      </div>
    </div>,

    // Step 2 — Mastery level
    <div key="mastery" className="flex flex-col gap-4">
      <DialogHeader>
        <p className="eyebrow">Question 3 of {TOTAL_STEPS}</p>
        <DialogTitle className="mt-2 text-lg leading-snug">
          What is your current mastery level?
        </DialogTitle>
        <DialogDescription>
          For the exam(s) you selected — be honest, it helps us tailor the difficulty.
        </DialogDescription>
      </DialogHeader>
      <div className="grid gap-2">
        {MASTERY_LEVELS.map((level) => (
          <button
            key={level.value}
            type="button"
            onClick={() => setState((s) => ({ ...s, masteryLevel: level.value }))}
            className={cn(
              "flex w-full items-center justify-between rounded-lg border px-4 py-3 text-left text-sm transition-all outline-none focus-visible:ring-2 focus-visible:ring-ring/50",
              state.masteryLevel === level.value
                ? "border-primary bg-primary/5"
                : "border-border bg-background text-muted-foreground hover:border-foreground/30 hover:text-foreground"
            )}
          >
            <div>
              <p className="font-semibold text-foreground">{level.label}</p>
              <p className="text-xs text-muted-foreground">{level.description}</p>
            </div>
            {state.masteryLevel === level.value && (
              <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-primary text-primary-foreground">
                <CheckIcon className="h-3 w-3" />
              </span>
            )}
          </button>
        ))}
      </div>
    </div>,

    // Step 3 — Explanation style
    <div key="explanation" className="flex flex-col gap-4">
      <DialogHeader>
        <p className="eyebrow">Question 4 of {TOTAL_STEPS}</p>
        <DialogTitle className="mt-2 text-lg leading-snug">
          How do you want explanations presented?
        </DialogTitle>
        <DialogDescription>
          Select all that feel right — we'll mix them as needed.
        </DialogDescription>
      </DialogHeader>
      <div className="flex flex-wrap gap-2">
        {EXPLANATION_STYLES.map((style) => (
          <ToggleChip
            key={style.value}
            selected={state.explanationStyles.includes(style.value)}
            onClick={() => toggleStyle(style.value)}
          >
            {style.label}
          </ToggleChip>
        ))}
      </div>
      {state.explanationStyles.includes("others") && (
        <div className="flex flex-col gap-1.5">
          <Label htmlFor="explanation-other" className="text-xs text-muted-foreground">
            Describe your preferred style
          </Label>
          <Input
            id="explanation-other"
            placeholder="e.g. analogies, diagrams, mnemonics…"
            value={state.explanationOther}
            onChange={(e) => setState((s) => ({ ...s, explanationOther: e.target.value }))}
          />
        </div>
      )}
    </div>,

    // Step 4 — Priority subjects
    <div key="subjects" className="flex flex-col gap-4">
      <DialogHeader>
        <p className="eyebrow">Question 5 of {TOTAL_STEPS}</p>
        <DialogTitle className="mt-2 text-lg leading-snug">
          Which subjects do you want to prioritize?
        </DialogTitle>
        <DialogDescription>
          List the topics you want to work on first — anything goes.
        </DialogDescription>
      </DialogHeader>
      <Textarea
        placeholder="e.g. Algebra, Reading Comprehension, Cell Biology, Abstract Reasoning…"
        value={state.prioritySubjects}
        onChange={(e) => setState((s) => ({ ...s, prioritySubjects: e.target.value }))}
        className="min-h-24 resize-none"
      />
    </div>,

    // Step 5 — Goals
    <div key="goals" className="flex flex-col gap-4">
      <DialogHeader>
        <p className="eyebrow">Question 6 of {TOTAL_STEPS}</p>
        <DialogTitle className="mt-2 text-lg leading-snug">
          Any specific goals you want to hit?
        </DialogTitle>
        <DialogDescription>
          E.g. improve speed, strengthen weak subjects, build confidence — whatever's on your mind.
        </DialogDescription>
      </DialogHeader>
      <Textarea
        placeholder="e.g. Hit 80%+ on Math mock tests before October, eliminate careless mistakes in English…"
        value={state.goals}
        onChange={(e) => setState((s) => ({ ...s, goals: e.target.value }))}
        className="min-h-24 resize-none"
      />
    </div>,
  ];

  return (
    <Dialog open={open}>
      <DialogContent
        showCloseButton={false}
        className="w-full max-w-md gap-0 overflow-hidden p-0 sm:max-w-md"
      >
        {/* Header bar */}
        <div className="flex items-center justify-between border-b border-foreground/10 px-5 py-3">
          <StepDots current={step} total={TOTAL_STEPS} />
          <button
            type="button"
            onClick={handleSkip}
            disabled={saving}
            className="inline-flex items-center gap-1 text-xs text-muted-foreground transition-colors hover:text-foreground disabled:pointer-events-none disabled:opacity-50"
          >
            <SkipForwardIcon className="h-3 w-3" />
            Skip for now
          </button>
        </div>

        {/* Step content */}
        <div className="px-5 py-5">{steps[step]}</div>

        {/* Footer nav */}
        <div className="flex items-center justify-between border-t border-foreground/10 bg-muted/30 px-5 py-3">
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setStep((s) => s - 1)}
            disabled={step === 0 || saving}
            className="gap-1"
          >
            <ArrowLeftIcon className="h-3.5 w-3.5" />
            Back
          </Button>

          {step < TOTAL_STEPS - 1 ? (
            <Button
              size="sm"
              onClick={() => setStep((s) => s + 1)}
              disabled={!canProceed || saving}
              className="gap-1"
            >
              Next
              <ArrowRightIcon className="h-3.5 w-3.5" />
            </Button>
          ) : (
            <Button
              size="sm"
              onClick={handleFinish}
              disabled={saving}
              className="gap-1"
            >
              {saving ? "Saving…" : "Finish setup"}
              {!saving && <CheckIcon className="h-3.5 w-3.5" />}
            </Button>
          )}
        </div>
      </DialogContent>
    </Dialog>
  );
}
