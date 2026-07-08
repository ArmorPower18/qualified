import Link from "next/link";
import { GraduationCap, Menu } from "lucide-react";
import { buttonVariants } from "@/components/ui/button";
import { createClient } from "@/lib/supabase/server";
import { UserMenu } from "@/components/user-menu";

const baseNav = [
  { href: "/dashboard", label: "Dashboard" },
  { href: "/review", label: "Review" },
  { href: "/mock-test", label: "Mock Tests" },
  { href: "/custom", label: "Other CET" },
  { href: "/pricing", label: "Pricing" },
];

export async function SiteHeader() {
  const supabase = await createClient();
  const user = await supabase.auth
    .getUser()
    .then(({ data }) => data.user)
    .catch(() => null);

  // Study plan only makes sense once signed in (it needs pre-test results to analyze).
  const nav = user
    ? [...baseNav.slice(0, 3), { href: "/study-plan", label: "Study Plan" }, ...baseNav.slice(3)]
    : baseNav;

  return (
    <header className="sticky top-0 z-40 w-full border-b border-foreground/15 bg-background/88 backdrop-blur-xl supports-[backdrop-filter]:bg-background/75">
      <div className="editorial-shell flex h-16 items-center justify-between">
        <Link
          href={user ? "/dashboard" : "/"}
          className="group flex items-center gap-2 text-lg font-semibold text-foreground"
        >
          <span className="flex h-8 w-8 items-center justify-center rounded-md bg-foreground text-background transition-transform duration-300 group-hover:-rotate-3">
            <GraduationCap className="h-4.5 w-4.5" />
          </span>
          Qualified
        </Link>
        <nav className="hidden items-center gap-1 rounded-full border border-foreground/15 bg-card/70 p-1 text-sm font-medium text-muted-foreground md:flex">
          {nav.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className="rounded-full px-3 py-1.5 transition-colors hover:bg-foreground hover:text-background"
            >
              {item.label}
            </Link>
          ))}
        </nav>
        <div className="flex items-center gap-2">
          {user ? (
            <UserMenu email={user.email ?? ""} />
          ) : (
            <>
              <Link href="/login" className={buttonVariants({ variant: "ghost" })}>
                Log in
              </Link>
              <Link href="/signup" className={buttonVariants({ className: "hidden rounded-md shadow-sm sm:inline-flex" })}>
                Sign up free
              </Link>
            </>
          )}
          <Link
            href="/dashboard"
            aria-label="Open navigation"
            className={buttonVariants({ variant: "outline", size: "icon", className: "md:hidden" })}
          >
            <Menu className="h-4 w-4" />
          </Link>
        </div>
      </div>
    </header>
  );
}
