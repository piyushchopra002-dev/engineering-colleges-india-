import { Metadata } from "next";
import Link from "next/link";
import { getAllFAQs, faqCategories, generateFAQSchema } from "@/lib/faq-data";
import { HelpCircle, ChevronRight } from "lucide-react";

export const metadata: Metadata = {
  title: "Frequently Asked Questions - Engineering College Admissions, Placements & More",
  description: "Get answers to common questions about engineering college admissions, JEE preparation, placements, branch selection, fees, scholarships, and college life.",
  keywords: "engineering faq, jee questions, admission queries, placement questions, college selection help",
};

export default function FAQPage() {
  const allFAQs = getAllFAQs();
  const faqSchema = generateFAQSchema(allFAQs);

  return (
    <main className="min-h-screen bg-gray-50">
      {/* Hero Section */}
      <section className="bg-gradient-to-r from-primary-600 to-blue-600 text-white py-20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center">
            <HelpCircle className="h-16 w-16 mx-auto mb-4" />
            <h1 className="text-4xl md:text-5xl font-bold mb-4">
              Frequently Asked Questions
            </h1>
            <p className="text-xl text-white/90 max-w-3xl mx-auto">
              Find answers to common questions about engineering admissions, placements, and college life
            </p>
          </div>
        </div>
      </section>

      {/* Categories Grid */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <h2 className="text-3xl font-bold text-slate-900 mb-8">Browse by Category</h2>
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6 mb-16">
          {faqCategories.map((category) => {
            const categoryFAQs = allFAQs.filter(faq => faq.category === category.slug);
            return (
              <Link
                key={category.slug}
                href={`/faq/${category.slug}`}
                className="group bg-white rounded-lg shadow-md p-6 hover:shadow-xl transition-all hover:-translate-y-1"
              >
                <div className="flex items-center justify-between mb-2">
                  <h3 className="text-xl font-semibold text-slate-900 group-hover:text-primary-600 transition-colors">
                    {category.name}
                  </h3>
                  <ChevronRight className="h-5 w-5 text-slate-400 group-hover:text-primary-600 group-hover:translate-x-1 transition-all" />
                </div>
                <p className="text-slate-600">
                  {categoryFAQs.length} questions answered
                </p>
              </Link>
            );
          })}
        </div>

        {/* All FAQs */}
        <div className="bg-white rounded-lg shadow-md p-8">
          <h2 className="text-2xl font-bold text-slate-900 mb-8">All Questions</h2>
          <div className="space-y-6">
            {allFAQs.map((faq, index) => (
              <details
                key={index}
                className="group border border-slate-200 rounded-lg overflow-hidden"
              >
                <summary className="flex items-center justify-between cursor-pointer p-6 hover:bg-slate-50 transition-colors">
                  <h3 className="text-lg font-semibold text-slate-900 pr-4">
                    {faq.question}
                  </h3>
                  <ChevronRight className="h-5 w-5 text-slate-400 transition-transform group-open:rotate-90 flex-shrink-0" />
                </summary>
                <div className="px-6 pb-6 pt-2">
                  <div className="text-slate-700 leading-relaxed whitespace-pre-line">
                    {faq.answer}
                  </div>
                  <Link
                    href={`/faq/${faq.category}`}
                    className="inline-flex items-center mt-4 text-primary-600 hover:text-primary-700 font-medium"
                  >
                    More {faqCategories.find(c => c.slug === faq.category)?.name} FAQs
                    <ChevronRight className="h-4 w-4 ml-1" />
                  </Link>
                </div>
              </details>
            ))}
          </div>
        </div>
      </section>

      {/* FAQ Schema */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify(faqSchema)
        }}
      />
    </main>
  );
}
