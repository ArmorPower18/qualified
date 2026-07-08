import { notFound } from "next/navigation";
import { getMockTestConfig } from "@/lib/data";
import { MockTestRunner } from "@/components/mock-test-runner";
import { createClient } from "@/lib/supabase/server";

export default async function MockTestPage({
  params,
}: {
  params: Promise<{ collegeSlug: string }>;
}) {
  const { collegeSlug } = await params;
  const config = await getMockTestConfig(collegeSlug);
  if (!config) notFound();

  // A student's first attempt at a given college's mock test is a free
  // diagnostic ("pre-test") that doesn't count against their plan's quota.
  let isPretest = false;
  const supabase = await createClient();
  const user = await supabase.auth
    .getUser()
    .then(({ data }) => data.user)
    .catch(() => null);
  if (user) {
    const { data: college } = await supabase.from("colleges").select("id").eq("slug", collegeSlug).single();
    if (college) {
      const { count } = await supabase
        .from("mock_test_attempts")
        .select("id", { count: "exact", head: true })
        .eq("user_id", user.id)
        .eq("college_id", college.id);
      isPretest = (count ?? 0) === 0;
    }
  }

  return (
    <div className="mx-auto max-w-3xl px-4 py-12">
      <MockTestRunner config={config} collegeSlug={collegeSlug} isPretest={isPretest} />
    </div>
  );
}
