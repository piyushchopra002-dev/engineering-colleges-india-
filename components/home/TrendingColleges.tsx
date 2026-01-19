"use client";

import Link from "next/link";
import { TrendingUp, Eye } from "lucide-react";
import { useEffect, useState } from "react";

interface TrendingCollege {
  id: string;
  name: string;
  slug: string;
  city: string;
  state: string;
  views?: number;
}

export function TrendingColleges() {
  const [trending, setTrending] = useState<TrendingCollege[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Simulate fetching trending colleges
    // In a real app, this would track actual page views
    const mockTrending: TrendingCollege[] = [
      { id: "1", name: "IIT Bombay", slug: "iit-bombay", city: "Mumbai", state: "Maharashtra", views: 15420 },
      { id: "2", name: "IIT Delhi", slug: "iit-delhi", city: "New Delhi", state: "Delhi", views: 14230 },
      { id: "3", name: "BITS Pilani", slug: "bits-pilani", city: "Pilani", state: "Rajasthan", views: 12890 },
      { id: "4", name: "IIT Madras", slug: "iit-madras", city: "Chennai", state: "Tamil Nadu", views: 11540 },
      { id: "5", name: "NIT Trichy", slug: "nit-trichy", city: "Tiruchirappalli", state: "Tamil Nadu", views: 10230 },
    ];
    
    setTimeout(() => {
      setTrending(mockTrending);
      setLoading(false);
    }, 500);
  }, []);

  if (loading) {
    return (
      <section className="py-16 bg-transparent">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="bg-gradient-to-br from-primary-600/20 to-fuchsia-600/20 backdrop-blur border border-white/20 rounded-2xl p-8">
            <div className="h-8 bg-white/10 rounded w-48 mb-6 animate-pulse"></div>
            <div className="space-y-3">
              {[1, 2, 3, 4, 5].map((i) => (
                <div key={i} className="h-16 bg-white/10 rounded animate-pulse"></div>
              ))}
            </div>
          </div>
        </div>
      </section>
    );
  }

  return (
    <section className="py-16 bg-transparent relative overflow-hidden">
      {/* Background Animation */}
      <div className="absolute inset-0 pointer-events-none">
        <div className="absolute top-1/2 left-10 w-80 h-80 bg-gradient-to-br from-primary-500/10 to-fuchsia-500/10 rounded-full blur-3xl animate-float" style={{ animationDuration: "16s" }}></div>
        <div className="absolute top-20 right-10 w-72 h-72 bg-gradient-to-br from-blue-500/10 to-purple-500/10 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "4s", animationDuration: "20s" }}></div>
      </div>
      
      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="bg-gradient-to-br from-primary-600/20 to-fuchsia-600/20 backdrop-blur border border-white/20 rounded-2xl p-8 hover:border-primary-500/50 transition-all relative overflow-hidden">
          {/* Inner Glow Effect */}
          <div className="absolute inset-0 bg-gradient-to-br from-primary-500/5 via-transparent to-fuchsia-500/5 animate-pulse" style={{ animationDuration: "5s" }}></div>
          <div className="relative">
          <div className="flex items-center gap-3 mb-6">
            <div className="p-3 bg-gradient-to-br from-primary-500 to-fuchsia-500 rounded-lg">
              <TrendingUp className="h-6 w-6 text-white" />
            </div>
            <div>
              <h2 className="text-2xl font-bold text-white">Trending Now</h2>
              <p className="text-slate-300 text-sm">Most viewed colleges this week</p>
            </div>
          </div>
          <div className="space-y-3">
            {trending.map((college, index) => (
              <Link
                key={college.id}
                href={`/colleges/${college.slug}`}
                className="group flex items-center justify-between p-4 bg-white/5 hover:bg-white/10 rounded-lg border border-white/10 hover:border-primary-500/50 transition-all"
                style={{ animationDelay: `${index * 0.1}s` }}
              >
                <div className="flex items-center gap-4">
                  <div className="flex items-center justify-center w-8 h-8 rounded-full bg-gradient-to-br from-primary-500 to-fuchsia-500 text-white font-bold text-sm">
                    {index + 1}
                  </div>
                  <div>
                    <h3 className="font-semibold text-white group-hover:text-primary-300 transition-colors">
                      {college.name}
                    </h3>
                    <p className="text-sm text-slate-400">
                      {college.city}, {college.state}
                    </p>
                  </div>
                </div>
                <div className="flex items-center gap-2 text-slate-400">
                  <Eye className="h-4 w-4" />
                  <span className="text-sm font-medium">{college.views?.toLocaleString()}</span>
                </div>
              </Link>
            ))}
          </div>
          <div className="mt-6 text-center">
            <Link
              href="/colleges"
              className="inline-block px-6 py-3 bg-gradient-to-r from-primary-500 to-fuchsia-500 text-white font-semibold rounded-lg hover:from-primary-400 hover:to-fuchsia-400 transition-all hover:scale-105"
            >
              Explore All Colleges
            </Link>
          </div>
        </div>
        </div>
      </div>
    </section>
  );
}
