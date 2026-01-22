import { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { getBlogsByCategory, blogCategories } from "@/lib/blog-data";
import { BookOpen, Calendar, Clock, ArrowRight, Home, ChevronRight } from "lucide-react";

interface BlogCategoryPageProps {
  params: {
    category: string;
  };
}

export async function generateStaticParams() {
  return blogCategories.map((category) => ({
    category: category.slug,
  }));
}

export async function generateMetadata({ params }: BlogCategoryPageProps): Promise<Metadata> {
  const category = blogCategories.find((c) => c.slug === params.category);
  
  if (!category) {
    return {
      title: "Category Not Found",
    };
  }

  return {
    title: `${category.name} - Engineering Blog`,
    description: `Read expert articles about ${category.name.toLowerCase()} for engineering students and aspirants.`,
    keywords: `${category.slug}, engineering blog, ${category.name.toLowerCase()}`,
  };
}

export default function BlogCategoryPage({ params }: BlogCategoryPageProps) {
  const category = blogCategories.find((c) => c.slug === params.category);
  
  if (!category) {
    notFound();
  }

  const posts = getBlogsByCategory(params.category);

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
            <Link href="/blog" className="hover:text-primary-600">
              Blog
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
            <BookOpen className="h-12 w-12 mb-4" />
            <h1 className="text-4xl md:text-5xl font-bold mb-4">
              {category.name}
            </h1>
            <p className="text-xl text-white/90">
              {posts.length} article{posts.length !== 1 ? 's' : ''} in this category
            </p>
          </div>
        </div>
      </section>

      {/* Posts Grid */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        {posts.length === 0 ? (
          <div className="text-center py-12">
            <BookOpen className="h-16 w-16 text-slate-300 mx-auto mb-4" />
            <p className="text-slate-600">No articles in this category yet.</p>
            <Link
              href="/blog"
              className="inline-block mt-4 text-primary-600 hover:text-primary-700 font-medium"
            >
              ← Back to all articles
            </Link>
          </div>
        ) : (
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            {posts.map((post) => (
              <Link
                key={post.slug}
                href={`/blog/${post.slug}`}
                className="group bg-white rounded-lg shadow-md overflow-hidden hover:shadow-xl transition-all hover:-translate-y-1"
              >
                <div className="relative h-48 bg-slate-200">
                  <div className="absolute inset-0 flex items-center justify-center text-slate-400">
                    <BookOpen className="h-16 w-16" />
                  </div>
                </div>
                <div className="p-6">
                  <div className="flex items-center gap-3 text-xs text-slate-600 mb-3">
                    <span className="px-2 py-1 bg-primary-100 text-primary-700 rounded-full font-medium">
                      {category.name}
                    </span>
                    <span className="flex items-center">
                      <Clock className="h-3 w-3 mr-1" />
                      {post.readTime} min
                    </span>
                  </div>
                  <h2 className="text-xl font-bold text-slate-900 mb-2 group-hover:text-primary-600 transition-colors line-clamp-2">
                    {post.title}
                  </h2>
                  <p className="text-slate-700 text-sm mb-4 line-clamp-3">
                    {post.excerpt}
                  </p>
                  <div className="flex items-center justify-between text-xs">
                    <span className="text-slate-600 flex items-center">
                      <Calendar className="h-3 w-3 mr-1" />
                      {new Date(post.publishedDate).toLocaleDateString()}
                    </span>
                    <span className="text-primary-600 font-medium flex items-center group-hover:translate-x-1 transition-transform">
                      Read <ArrowRight className="h-3 w-3 ml-1" />
                    </span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        )}

        {/* Other Categories */}
        <div className="mt-16">
          <h2 className="text-2xl font-bold text-slate-900 mb-6">Other Categories</h2>
          <div className="grid md:grid-cols-3 gap-4">
            {blogCategories
              .filter((c) => c.slug !== params.category)
              .map((otherCategory) => (
                <Link
                  key={otherCategory.slug}
                  href={`/blog/category/${otherCategory.slug}`}
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
    </main>
  );
}
