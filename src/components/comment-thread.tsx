"use client";

import { useEffect, useState } from "react";
import { MessageCircle } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Textarea } from "@/components/ui/textarea";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import { createClient } from "@/lib/supabase/client";
import type { Comment } from "@/lib/types";

type CommentWithEmail = Comment & { email?: string };

export function CommentThread({ questionId }: { questionId: string }) {
  const supabase = createClient();
  const [open, setOpen] = useState(false);
  const [comments, setComments] = useState<CommentWithEmail[]>([]);
  const [body, setBody] = useState("");
  const [userEmail, setUserEmail] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (!open) return;
    if (questionId.startsWith("sample-")) return; // demo questions have no real DB row

    supabase.auth.getUser().then(({ data }) => setUserEmail(data.user?.email ?? null));

    supabase
      .from("comments")
      .select("*")
      .eq("question_id", questionId)
      .order("created_at", { ascending: true })
      .then(({ data }) => {
        if (data) setComments(data as CommentWithEmail[]);
      });
  }, [open, questionId, supabase]);

  async function handlePost() {
    if (!body.trim()) return;
    setLoading(true);
    const { data: userData } = await supabase.auth.getUser();
    if (!userData.user) {
      setLoading(false);
      window.location.href = "/login";
      return;
    }
    const { data, error } = await supabase
      .from("comments")
      .insert({ question_id: questionId, user_id: userData.user.id, body })
      .select()
      .single();
    setLoading(false);
    if (!error && data) {
      setComments((prev) => [...prev, data as CommentWithEmail]);
      setBody("");
    }
  }

  const isDemo = questionId.startsWith("sample-");

  return (
    <div>
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        className="flex items-center gap-1.5 text-sm text-muted-foreground hover:text-primary"
      >
        <MessageCircle className="h-4 w-4" />
        {open ? "Hide discussion" : `Discuss this question (${comments.length})`}
      </button>

      {open && (
        <div className="mt-3 flex flex-col gap-3 border-t pt-3">
          {isDemo && (
            <p className="text-xs text-muted-foreground">
              This is a sample question — comments here are illustrative until real questions are seeded.
            </p>
          )}
          {comments.length === 0 && (
            <p className="text-sm text-muted-foreground">No comments yet. Be the first to ask a question!</p>
          )}
          {comments.map((c) => (
            <div key={c.id} className="flex gap-2">
              <Avatar className="h-7 w-7">
                <AvatarFallback className="text-xs">{(c.email ?? "U").charAt(0).toUpperCase()}</AvatarFallback>
              </Avatar>
              <div className="rounded-md bg-secondary/60 px-3 py-2 text-sm">{c.body}</div>
            </div>
          ))}

          <div className="flex flex-col gap-2">
            <Textarea
              placeholder={userEmail ? "Ask a question or share a tip..." : "Log in to join the discussion"}
              value={body}
              onChange={(e) => setBody(e.target.value)}
              disabled={isDemo}
              rows={2}
            />
            <Button size="sm" className="self-end" onClick={handlePost} disabled={loading || isDemo}>
              Post
            </Button>
          </div>
        </div>
      )}
    </div>
  );
}
