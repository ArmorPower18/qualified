import { notFound } from "next/navigation";
import { getMockTestConfig } from "@/lib/data";
import { MockTestRunner } from "@/components/mock-test-runner";

export default async function MockTestPage({
  params,
}: {
  params: Promise<{ collegeSlug: string }>;
}) {
  const { collegeSlug } = await params;
  const config = await getMockTestConfig(collegeSlug);
  if (!config) notFound();

  return (
    <div className="mx-auto max-w-3xl px-4 py-12">
      <MockTestRunner config={config} collegeSlug={collegeSlug} />
    </div>
  );
}
