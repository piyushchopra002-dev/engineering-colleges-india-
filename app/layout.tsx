import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { Providers } from "./providers";
import { Navigation } from "@/components/layout/Navigation";
import { Footer } from "@/components/layout/Footer";
import { CookieConsent } from "@/components/CookieConsent";
import { BackToTop } from "@/components/ui/BackToTop";
import { CustomCursor } from "@/components/ui/CustomCursor";
import { ScrollProgress } from "@/components/ui/ScrollProgress";
import { Toaster } from "react-hot-toast";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: {
    default: "Best Engineering Colleges in India | Rankings, Placements, Cutoffs",
    template: "%s | Best Engineering Colleges in India",
  },
  description:
    "Comprehensive directory of top engineering colleges in India. Compare rankings, placements, cutoffs, infrastructure, faculty, and more. Get AI-powered counseling for college selection.",
  keywords: [
    "engineering colleges India",
    "IIT",
    "NIT",
    "engineering college rankings",
    "college placements",
    "JEE cutoffs",
    "engineering college comparison",
  ],
  authors: [{ name: "Best Engineering Colleges" }],
  creator: "Best Engineering Colleges",
  publisher: "Best Engineering Colleges",
  formatDetection: {
    email: false,
    address: false,
    telephone: false,
  },
  metadataBase: new URL("http://localhost:3000"),
  openGraph: {
    type: "website",
    locale: "en_IN",
    url: "/",
    siteName: "Best Engineering Colleges in India",
    title: "Best Engineering Colleges in India | Rankings, Placements, Cutoffs",
    description:
      "Comprehensive directory of top engineering colleges in India. Compare rankings, placements, cutoffs, and more.",
  },
  twitter: {
    card: "summary_large_image",
    title: "Best Engineering Colleges in India",
    description: "Comprehensive directory of top engineering colleges in India.",
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
  verification: {
    google: "Cer0A2QQS78xCeF6ESKJ7CYjx539e-TyiU58vT8Iko8",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={inter.className}>
        <Providers>
          <ScrollProgress />
          <CustomCursor />
          <Navigation />
          <main className="min-h-screen">{children}</main>
          <Footer />
          <CookieConsent />
          <BackToTop />
          <Toaster position="top-right" />
        </Providers>
      </body>
    </html>
  );
}
