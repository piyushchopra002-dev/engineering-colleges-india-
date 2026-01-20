"use client";

import Link from "next/link";
import { InternalLink, RelatedContentSection } from "@/lib/internal-linking";
import { ArrowRight, TrendingUp } from "lucide-react";

interface RelatedContentProps {
  sections: RelatedContentSection[];
  className?: string;
}

export function RelatedContent({ sections, className = "" }: RelatedContentProps) {
  if (!sections || sections.length === 0) {
    return null;
  }

  return (
    <div className={`bg-gradient-to-br from-blue-50 to-purple-50 rounded-xl p-8 ${className}`}>
      <div className="flex items-center gap-2 mb-6">
        <TrendingUp className="w-6 h-6 text-blue-600" />
        <h2 className="text-2xl font-bold text-gray-800">Related Content</h2>
      </div>

      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
        {sections.map((section, index) => (
          <div key={index} className="bg-white rounded-lg p-6 shadow-sm hover:shadow-md transition-shadow">
            <h3 className="font-bold text-lg mb-4 text-gray-800 border-b border-gray-200 pb-2">
              {section.title}
            </h3>
            <ul className="space-y-3">
              {section.links.slice(0, 5).map((link, linkIndex) => (
                <li key={linkIndex}>
                  <Link
                    href={link.url}
                    className="flex items-center gap-2 text-blue-600 hover:text-blue-700 hover:underline group transition-colors"
                    rel={link.rel}
                  >
                    <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                    <span className="text-sm">{link.text}</span>
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </div>
  );
}

// Compact version for sidebars
interface RelatedLinksCompactProps {
  title: string;
  links: InternalLink[];
  className?: string;
}

export function RelatedLinksCompact({
  title,
  links,
  className = "",
}: RelatedLinksCompactProps) {
  if (!links || links.length === 0) {
    return null;
  }

  return (
    <div className={`bg-white rounded-lg p-6 shadow-sm border border-gray-200 ${className}`}>
      <h3 className="font-bold text-lg mb-4 text-gray-800">{title}</h3>
      <ul className="space-y-2">
        {links.map((link, index) => (
          <li key={index}>
            <Link
              href={link.url}
              className="flex items-center gap-2 text-blue-600 hover:text-blue-700 hover:underline text-sm transition-colors"
              rel={link.rel}
            >
              <ArrowRight className="w-3 h-3" />
              {link.text}
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}

// Inline related links (for within content)
interface InlineRelatedLinksProps {
  links: InternalLink[];
  className?: string;
}

export function InlineRelatedLinks({
  links,
  className = "",
}: InlineRelatedLinksProps) {
  if (!links || links.length === 0) {
    return null;
  }

  return (
    <div className={`flex flex-wrap gap-2 ${className}`}>
      {links.map((link, index) => (
        <Link
          key={index}
          href={link.url}
          className="inline-flex items-center gap-1 bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm hover:bg-blue-200 transition-colors"
          rel={link.rel}
        >
          {link.text}
          <ArrowRight className="w-3 h-3" />
        </Link>
      ))}
    </div>
  );
}
