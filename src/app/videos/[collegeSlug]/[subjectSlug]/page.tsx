import { notFound } from "next/navigation";
import { PlayCircle } from "lucide-react";
import { getStaticCollege } from "@/lib/colleges-static";
import { getSubjectVideos } from "@/lib/data";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

export default async function VideosPage({
  params,
}: {
  params: Promise<{ collegeSlug: string; subjectSlug: string }>;
}) {
  const { collegeSlug, subjectSlug } = await params;
  const college = getStaticCollege(collegeSlug);
  const subject = college?.subjects.find((s) => s.slug === subjectSlug);
  if (!college || !subject) notFound();

  const videos = await getSubjectVideos(collegeSlug, subjectSlug);

  return (
    <div className="mx-auto max-w-3xl px-4 py-12">
      <span className="text-sm font-semibold text-primary">
        {college.examName} · {subject.name}
      </span>
      <h1 className="text-3xl font-bold">Videos: {subject.name}</h1>
      <p className="mt-2 text-muted-foreground">{subject.description}</p>

      <div className="mt-8 flex flex-col gap-6">
        {videos.length === 0 && (
          <Card>
            <CardHeader className="items-center text-center">
              <PlayCircle className="h-10 w-10 text-muted-foreground" />
              <CardTitle className="mt-2 text-base font-medium text-muted-foreground">
                No videos yet for this subject
              </CardTitle>
            </CardHeader>
            <CardContent className="text-center text-sm text-muted-foreground">
              We&apos;re curating YouTube lessons for every topic — check back soon.
            </CardContent>
          </Card>
        )}
        {videos.map((v) => (
          <Card key={v.id}>
            <CardHeader>
              <CardTitle className="text-base">{v.title}</CardTitle>
              <p className="text-sm text-muted-foreground">{v.topic}</p>
            </CardHeader>
            <CardContent>
              <div className="aspect-video w-full overflow-hidden rounded-md">
                <iframe
                  className="h-full w-full"
                  src={`https://www.youtube.com/embed/${v.youtube_id}`}
                  title={v.title}
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                  allowFullScreen
                />
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}
