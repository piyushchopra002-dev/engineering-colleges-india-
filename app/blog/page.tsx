import { Metadata } from "next";
import Link from "next/link";
import { getAllBlogs, blogCategories } from "@/lib/blog-data";
import { BookOpen, Calendar, Clock, ArrowRight } from "lucide-react";
import Image from "next/image";

export const metadata: Metadata = {
  title: "Engineering College Blog - Admissions, JEE Prep, Placements & Career Guides",
  description: "Read expert articles on engineering admissions, JEE preparation strategies, placement tips, branch comparison, and career guidance for engineering students.",
  keywords: "engineering blog, jee preparation, college admissions, placement tips, career guidance",
};

export default function BlogPage() {
  const posts = getAllBlogs();
  const featuredPost = posts[0];
  const recentPosts = posts.slice(1);

  return (
    <main className="min-h-screen bg-gray-50">
      {/* Hero Section */}
      <section className="bg-gradient-to-r from-primary-600 to-blue-600 text-white py-20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center">
            <BookOpen className="h-16 w-16 mx-auto mb-4" />
            <h1 className="text-4xl md:text-5xl font-bold mb-4">
              Engineering College Blog
            </h1>
            <p className="text-xl text-white/90 max-w-3xl mx-auto">
              Expert guides on admissions, JEE preparation, placements, and career success
            </p>
          </div>
        </div>
      </section>

      {/* Categories */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="flex flex-wrap gap-3 justify-center">
          {blogCategories.map((category) => (
            <Link
              key={category.slug}
              href={`/blog/category/${category.slug}`}
              className="px-4 py-2 bg-white rounded-full shadow-sm hover:shadow-md hover:bg-primary-50 transition-all text-slate-700 hover:text-primary-700 font-medium"
            >
              {category.name}
            </Link>
          ))}
        </div>
      </section>

      {/* Featured Post */}
      {featuredPost && (
        <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <h2 className="text-2xl font-bold text-slate-900 mb-6">Featured Article</h2>
          <Link
            href={`/blog/${featuredPost.slug}`}
            className="group block bg-white rounded-lg shadow-md overflow-hidden hover:shadow-xl transition-all"
          >
            <div className="md:flex">
              <div className="md:w-1/2 relative h-64 md:h-auto bg-slate-200">
                <div className="absolute inset-0 flex items-center justify-center text-slate-400">
                  <BookOpen className="h-24 w-24" />
                </div>
              </div>
              <div className="md:w-1/2 p-8">
                <div className="flex items-center gap-4 text-sm text-slate-600 mb-3">
                  <span className="px-3 py-1 bg-primary-100 text-primary-700 rounded-full font-medium">
                    {blogCategories.find(c => c.slug === featuredPost.category)?.name}
                  </span>
                  <span className="flex items-center">
                    <Clock className="h-4 w-4 mr-1" />
                    {featuredPost.readTime} min read
                  </span>
                </div>
                <h3 className="text-2xl font-bold text-slate-900 mb-3 group-hover:text-primary-600 transition-colors">
                  {featuredPost.title}
                </h3>
                <p className="text-slate-700 mb-4 line-clamp-3">
                  {featuredPost.excerpt}
                </p>
                <div className="flex items-center justify-between">
                  <div className="flex items-center text-sm text-slate-600">
                    <Calendar className="h-4 w-4 mr-1" />
                    {new Date(featuredPost.publishedDate).toLocaleDateString("en-US", {
                      month: "long",
                      day: "numeric",
                      year: "numeric"
                    })}
                  </div>
                  <span className="flex items-center text-primary-600 font-medium group-hover:translate-x-2 transition-transform">
                    Read More <ArrowRight className="h-4 w-4 ml-1" />
                  </span>
                </div>
              </div>
            </div>
          </Link>
        </section>
      )}

      {/* Recent Posts */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 pb-20">
        <h2 className="text-2xl font-bold text-slate-900 mb-6">Recent Articles</h2>
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {recentPosts.map((post) => (
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
                    {blogCategories.find(c => c.slug === post.category)?.name}
                  </span>
                  <span className="flex items-center">
                    <Clock className="h-3 w-3 mr-1" />
                    {post.readTime} min
                  </span>
                </div>
                <h3 className="text-xl font-bold text-slate-900 mb-2 group-hover:text-primary-600 transition-colors line-clamp-2">
                  {post.title}
                </h3>
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
      </section>
    </main>
  );
}
