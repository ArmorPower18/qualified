import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import { SiteHeader } from "@/components/site-header";
import { SiteFooter } from "@/components/site-footer";
import { OnboardingProvider } from "@/components/onboarding-provider";
import { PretestNotice } from "@/components/pretest-notice";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Qualified — Free CET Reviewer for UP, Ateneo, DLSU & UST",
  description:
    "Free practice questions, videos, and full-length mock tests to help Filipino students prepare for UPCAT, ACET, DCAT, and USTET.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}
    >
      <body className="min-h-full flex flex-col">
        <SiteHeader />
        <OnboardingProvider>
          <main className="flex-1">{children}</main>
        </OnboardingProvider>
        <PretestNotice />
        <SiteFooter />
      </body>
    </html>
  );
}
