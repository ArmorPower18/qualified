import Link from "next/link";

export function SiteFooter() {
  return (
    <footer className="border-t border-foreground/15 bg-foreground text-background">
      <div className="editorial-shell py-10 text-sm">
        <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
          <p>
            <span className="font-semibold">Qualified</span> - free CET prep for every Filipino
            student.
          </p>
          <div className="flex gap-6 text-background/70">
            <Link href="/colleges" className="transition-colors hover:text-background">
              Colleges
            </Link>
            <Link href="/mock-test" className="transition-colors hover:text-background">
              Mock Tests
            </Link>
            <Link href="/custom" className="transition-colors hover:text-background">
              Other CET
            </Link>
          </div>
        </div>
        <p className="mt-6 max-w-2xl text-xs text-background/60">
          Qualified is an independent, free, open-source project. Not affiliated with UP, Ateneo,
          DLSU, or UST.
        </p>
      </div>
    </footer>
  );
}
