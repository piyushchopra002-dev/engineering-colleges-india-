import { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { getFAQsByCategory, faqCategories, generateFAQSchema } from "@/lib/faq-data";
import { HelpCircle, ChevronRight, Home } from "lucide-react";

interface FAQCategoryPageProps {
  params: {
    category: string;
  };
}

export async function generateStaticParams() {
  return faqCategories.map((category) => ({
    category: category.slug,
  }));
}

export async function generateMetadata({ params }: FAQCategoryPageProps): Promise<Metadata> {
  const category = faqCategories.find((c) => c.slug === params.category);
  
  if (!category) {
    return {
      title: "Category Not Found",
    };
  }

  return {
    title: `${category.name} - Engineering College FAQs`,
    description: `Get answers to frequently asked questions about ${category.name.toLowerCase()} for engineering colleges in India.`,
    keywords: `${category.slug}, engineering ${category.slug}, ${category.name.toLowerCase()} questions`,
  };
}

export default function FAQCategoryPage({ params }: FAQCategoryPageProps) {
  const category = faqCategories.find((c) => c.slug === params.category);
  
  if (!category) {
    notFound();
  }

  const faqs = getFAQsByCategory(params.category);
  const faqSchema = generateFAQSchema(faqs);

  return (
    <main className="min-h-screen bg-gray-50">
      {/* Breadcrumbs */}
      <div className="bg-white border-b border-slate-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <nav className="flex items-center space-x-2 text-sm text-slate-600">
            <Link href="/" className="hover:text-primary-600 flex items-center">
              <Home className="h-4 w-4 mr-1" />
              Home
            </Link>
            <ChevronRight className="h-4 w-4" />
            <Link href="/faq" className="hover:text-primary-600">
              FAQ
            </Link>
            <ChevronRight className="h-4 w-4" />
            <span className="text-slate-900 font-medium">{category.name}</span>
          </nav>
        </div>
      </div>

      {/* Hero Section */}
      <section className="bg-gradient-to-r from-primary-600 to-blue-600 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="max-w-3xl">
            <HelpCircle className="h-12 w-12 mb-4" />
            <h1 className="text-4xl md:text-5xl font-bold mb-4">
              {category.name}
            </h1>
            <p className="text-xl text-white/90">
              Find answers to your questions about {category.name.toLowerCase()}
            </p>
          </div>
        </div>
      </section>

      {/* FAQs */}
      <section className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="bg-white rounded-lg shadow-md p-8">
          <div className="space-y-6">
            {faqs.map((faq, index) => (
              <details
                key={index}
                className="group border border-slate-200 rounded-lg overflow-hidden"
              >
                <summary className="flex items-center justify-between cursor-pointer p-6 hover:bg-slate-50 transition-colors">
                  <h2 className="text-lg font-semibold text-slate-900 pr-4">
                    {faq.question}
                  </h2>
                  <ChevronRight className="h-5 w-5 text-slate-400 transition-transform group-open:rotate-90 flex-shrink-0" />
                </summary>
                <div className="px-6 pb-6 pt-2">
                  <p className="text-slate-700 leading-relaxed whitespace-pre-line">
                    {faq.answer}
                  </p>
                </div>
              </details>
            ))}
          </div>
        </div>

        {/* Other Categories */}
        <div className="mt-12">
          <h2 className="text-2xl font-bold text-slate-900 mb-6">Explore Other Categories</h2>
          <div className="grid md:grid-cols-2 gap-4">
            {faqCategories
              .filter((c) => c.slug !== params.category)
              .map((otherCategory) => (
                <Link
                  key={otherCategory.slug}
                  href={`/faq/${otherCategory.slug}`}
                  className="group bg-white rounded-lg shadow-md p-6 hover:shadow-xl transition-all hover:-translate-y-1"
                >
                  <div className="flex items-center justify-between">
                    <h3 className="text-lg font-semibold text-slate-900 group-hover:text-primary-600 transition-colors">
                      {otherCategory.name}
                    </h3>
                    <ChevronRight className="h-5 w-5 text-slate-400 group-hover:text-primary-600 group-hover:translate-x-1 transition-all" />
                  </div>
                </Link>
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
