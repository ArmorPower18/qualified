"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { RotateCw, CheckCircle2, XCircle } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { createClient } from "@/lib/supabase/client";
import type { Flashcard, Difficulty } from "@/lib/types";

export function FlashcardSession({
  cards,
  lessonIds,
  difficulty,
}: {
  cards: Flashcard[];
  lessonIds: string[];
  difficulty: Difficulty | null;
}) {
  const router = useRouter();
  const supabase = createClient();
  const [index, setIndex] = useState(0);
  const [flipped, setFlipped] = useState(false);
  const [knewIt, setKnewIt] = useState(0);
  const [stillLearning, setStillLearning] = useState(0);
  const [done, setDone] = useState(false);
  const [saved, setSaved] = useState(false);

  const card = cards[index];

  async function finish(finalKnewIt: number, finalStillLearning: number) {
    setDone(true);
    const { data: userData } = await supabase.auth.getUser();
    if (!userData.user) return;
    await supabase.from("review_attempts").insert({
      user_id: userData.user.id,
      mode: "flashcard",
      lesson_ids: lessonIds,
      difficulty,
      question_count: cards.length,
      score: finalKnewIt,
      total_questions: finalKnewIt + finalStillLearning,
      completed_at: new Date().toISOString(),
    });
    setSaved(true);
  }

  function handleResponse(knew: boolean) {
    const nextKnewIt = knew ? knewIt + 1 : knewIt;
    const nextStillLearning = knew ? stillLearning : stillLearning + 1;
    setKnewIt(nextKnewIt);
    setStillLearning(nextStillLearning);
    if (index + 1 >= cards.length) {
      finish(nextKnewIt, nextStillLearning);
      return;
    }
    setIndex((i) => i + 1);
    setFlipped(false);
  }

  if (done) {
    const total = knewIt + stillLearning;
    const pct = total ? Math.round((knewIt / total) * 100) : 0;
    return (
      <Card className="studio-card">
        <CardContent className="flex flex-col items-center gap-3 py-10 text-center">
          <CheckCircle2 className="h-10 w-10 text-primary" />
          <h2 className="text-xl font-semibold">Deck complete!</h2>
          <p className="text-4xl font-bold text-primary">{pct}%</p>
          <p className="text-muted-foreground">
            {knewIt} of {total} cards marked &quot;knew it&quot;
          </p>
          {!saved && (
            <p className="text-xs text-muted-foreground">Log in to save this to your mastery dashboard.</p>
          )}
          <div className="mt-4 flex gap-3">
            <Button variant="outline" onClick={() => router.push("/review/flashcards")}>
              New deck
            </Button>
            {saved && <Button onClick={() => router.push("/dashboard")}>View dashboard</Button>}
          </div>
        </CardContent>
      </Card>
    );
  }

  return (
    <div className="flex flex-col gap-4">
      <div className="flex items-center justify-between text-sm text-muted-foreground">
        <span>
          Card {index + 1} of {cards.length}
        </span>
        <span className="capitalize">{card.difficulty}</span>
      </div>
      <Progress value={(index / cards.length) * 100} />

      <button
        type="button"
        onClick={() => setFlipped((f) => !f)}
        className="studio-card flex min-h-64 w-full flex-col items-center justify-center p-8 text-center"
      >
        <p className="text-lg font-medium">{flipped ? card.back : card.front}</p>
        <span className="mt-6 flex items-center gap-1.5 text-xs text-muted-foreground">
          <RotateCw className="h-3 w-3" /> {flipped ? "Showing answer — tap to flip back" : "Tap to reveal answer"}
        </span>
      </button>

      {flipped && (
        <div className="flex justify-center gap-3">
          <Button variant="outline" className="border-destructive/40 text-destructive" onClick={() => handleResponse(false)}>
            <XCircle className="mr-1.5 h-4 w-4" /> Still learning
          </Button>
          <Button onClick={() => handleResponse(true)}>
            <CheckCircle2 className="mr-1.5 h-4 w-4" /> Knew it
          </Button>
        </div>
      )}
    </div>
  );
}
