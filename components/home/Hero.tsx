"use client";

import Link from "next/link";
import { Search, GraduationCap, Sparkles, TrendingUp, Award } from "lucide-react";
import { useState, useEffect } from "react";
import { ParticleEffect } from "@/components/ui/ParticleEffect";
import { FloatingDecorations } from "@/components/ui/FloatingDecorations";

export function Hero() {
  const [searchQuery, setSearchQuery] = useState("");
  const [scrollY, setScrollY] = useState(0);
  const [searchFocused, setSearchFocused] = useState(false);
  const [showQuickStats, setShowQuickStats] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrollY(window.scrollY);
    };

    window.addEventListener("scroll", handleScroll, { passive: true });
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  useEffect(() => {
    const timer = setTimeout(() => setShowQuickStats(true), 3000);
    return () => clearTimeout(timer);
  }, []);

  return (
    <section className="relative text-white overflow-hidden">
      {/* Animated Background */}
      <div className="absolute inset-0 overflow-hidden">
        {/* Smoke Texture Background */}
        <svg className="absolute inset-0 w-full h-full opacity-30" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <filter id="smoke">
              <feTurbulence type="fractalNoise" baseFrequency="0.01" numOctaves="3" result="turbulence">
                <animate attributeName="baseFrequency" values="0.01;0.015;0.01" dur="20s" repeatCount="indefinite" />
              </feTurbulence>
              <feDisplacementMap in="SourceGraphic" in2="turbulence" scale="50" />
              <feGaussianBlur stdDeviation="3" />
            </filter>
          </defs>
          <rect width="100%" height="100%" fill="url(#smokeGradient)" filter="url(#smoke)" />
          <defs>
            <linearGradient id="smokeGradient" x1="0%" y1="0%" x2="100%" y2="100%">
              <stop offset="0%" stopColor="#a855f7" stopOpacity="0.1" />
              <stop offset="50%" stopColor="#ec4899" stopOpacity="0.08" />
              <stop offset="100%" stopColor="#3b82f6" stopOpacity="0.1" />
            </linearGradient>
          </defs>
        </svg>

        {/* Animated Smoke Clouds */}
        <div className="absolute top-0 left-0 w-full h-full">
          {/* Smoke Cloud 1 */}
          <div className="absolute top-20 left-10 w-96 h-96 opacity-20 animate-float" style={{ animationDuration: "25s" }}>
            <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <filter id="smokeCloud1">
                  <feGaussianBlur in="SourceGraphic" stdDeviation="10" />
                  <feColorMatrix type="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" />
                </filter>
              </defs>
              <circle cx="100" cy="100" r="80" fill="#ffffff" filter="url(#smokeCloud1)" opacity="0.3" />
              <circle cx="120" cy="90" r="60" fill="#ffffff" filter="url(#smokeCloud1)" opacity="0.25" />
              <circle cx="80" cy="95" r="70" fill="#ffffff" filter="url(#smokeCloud1)" opacity="0.28" />
            </svg>
          </div>

          {/* Smoke Cloud 2 */}
          <div className="absolute top-40 right-20 w-80 h-80 opacity-15 animate-float" style={{ animationDelay: "5s", animationDuration: "30s" }}>
            <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <filter id="smokeCloud2">
                  <feGaussianBlur in="SourceGraphic" stdDeviation="12" />
                  <feColorMatrix type="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 20 -8" />
                </filter>
              </defs>
              <circle cx="100" cy="100" r="90" fill="#e0e7ff" filter="url(#smokeCloud2)" opacity="0.4" />
              <circle cx="130" cy="110" r="70" fill="#e0e7ff" filter="url(#smokeCloud2)" opacity="0.35" />
              <circle cx="70" cy="105" r="75" fill="#e0e7ff" filter="url(#smokeCloud2)" opacity="0.38" />
            </svg>
          </div>

          {/* Smoke Cloud 3 */}
          <div className="absolute bottom-20 left-1/3 w-72 h-72 opacity-18 animate-float" style={{ animationDelay: "10s", animationDuration: "28s" }}>
            <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <filter id="smokeCloud3">
                  <feGaussianBlur in="SourceGraphic" stdDeviation="11" />
                  <feColorMatrix type="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 19 -7.5" />
                </filter>
              </defs>
              <circle cx="100" cy="100" r="85" fill="#fce7f3" filter="url(#smokeCloud3)" opacity="0.35" />
              <circle cx="125" cy="95" r="65" fill="#fce7f3" filter="url(#smokeCloud3)" opacity="0.3" />
              <circle cx="75" cy="100" r="72" fill="#fce7f3" filter="url(#smokeCloud3)" opacity="0.33" />
            </svg>
          </div>

          {/* Smoke Cloud 4 */}
          <div className="absolute top-1/2 right-1/4 w-64 h-64 opacity-16 animate-float" style={{ animationDelay: "15s", animationDuration: "32s" }}>
            <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <filter id="smokeCloud4">
                  <feGaussianBlur in="SourceGraphic" stdDeviation="13" />
                  <feColorMatrix type="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 21 -8.5" />
                </filter>
              </defs>
              <circle cx="100" cy="100" r="75" fill="#ddd6fe" filter="url(#smokeCloud4)" opacity="0.38" />
              <circle cx="115" cy="105" r="55" fill="#ddd6fe" filter="url(#smokeCloud4)" opacity="0.32" />
              <circle cx="85" cy="98" r="68" fill="#ddd6fe" filter="url(#smokeCloud4)" opacity="0.35" />
            </svg>
          </div>
        </div>

        {/* Gradient Orbs */}
        <div className="absolute top-10 left-10 w-96 h-96 bg-primary-500/30 rounded-full blur-3xl animate-float animate-morph"></div>
        <div className="absolute top-32 right-20 w-80 h-80 bg-fuchsia-500/20 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "2s", animationDuration: "12s" }}></div>
        <div className="absolute bottom-20 left-1/3 w-72 h-72 bg-blue-500/25 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "4s", animationDuration: "10s" }}></div>
        <div className="absolute top-1/2 right-1/4 w-64 h-64 bg-pink-500/20 rounded-full blur-3xl animate-float" style={{ animationDelay: "1s", animationDuration: "14s" }}></div>
        
        {/* Floating Decorations */}
        <FloatingDecorations />
        
        {/* Particle Effect */}
        <ParticleEffect count={15} />
      </div>
      <div className="absolute inset-0 bg-gradient-to-b from-black/10 via-black/20 to-black/40"></div>
      <div 
        className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20 md:py-32 transition-transform duration-100"
        style={{ transform: `translateY(${scrollY * 0.3}px)` }}
      >
        <div className="text-center">
          {/* Floating Badges */}
          <div className="flex justify-center gap-3 mb-6 animate-fade-in-up">
            <div className="px-4 py-2 bg-white/10 backdrop-blur border border-white/20 rounded-full text-white text-sm font-medium flex items-center gap-2 animate-bounce" style={{ animationDelay: "1s", animationDuration: "3s" }}>
              <Sparkles className="h-4 w-4 text-yellow-400" />
              500+ Colleges
            </div>
            <div className="px-4 py-2 bg-white/10 backdrop-blur border border-white/20 rounded-full text-white text-sm font-medium flex items-center gap-2 animate-bounce" style={{ animationDelay: "1.5s", animationDuration: "3s" }}>
              <TrendingUp className="h-4 w-4 text-green-400" />
              Live Rankings
            </div>
          </div>

          <div className="flex justify-center mb-6 animate-scale-in">
            <GraduationCap className="h-16 w-16 md:h-20 md:w-20 text-white drop-shadow animate-pulse" />
          </div>
          <h1 className="text-4xl md:text-6xl font-bold mb-6 text-balance animate-fade-in-up" style={{ animationDelay: "0.1s" }}>
            Find the Best{" "}
            <span className="bg-gradient-to-r from-primary-300 via-fuchsia-300 to-pink-300 bg-clip-text text-transparent animate-gradient">
              Engineering Colleges
            </span>{" "}
            in India
          </h1>
          <p className="text-xl md:text-2xl mb-8 text-slate-200 max-w-3xl mx-auto animate-fade-in-up" style={{ animationDelay: "0.2s" }}>
            Compare rankings, placements, cutoffs, infrastructure, and more.
            Get AI-powered counseling for your college selection.
          </p>

          <div className="max-w-2xl mx-auto mb-8 animate-fade-in-up" style={{ animationDelay: "0.3s" }}>
            <div className="relative group">
              <Search className={`absolute left-4 top-1/2 transform -translate-y-1/2 h-5 w-5 transition-all ${searchFocused ? 'text-primary-500 scale-125' : 'text-slate-500'}`} />
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onFocus={() => setSearchFocused(true)}
                onBlur={() => setTimeout(() => setSearchFocused(false), 200)}
                placeholder="Search colleges, branches, cities..."
                className="w-full pl-12 pr-4 py-4 rounded-full bg-white text-slate-900 text-lg focus:outline-none focus:ring-4 focus:ring-primary-300 shadow-lg shadow-black/20 transition-all hover:shadow-2xl focus:scale-105"
              />
              {searchFocused && (
                <div className="absolute top-full left-0 right-0 mt-2 bg-white rounded-2xl shadow-2xl p-4 animate-fade-in-up z-50">
                  <div className="space-y-2">
                    <div className="text-sm text-slate-600 font-semibold mb-2 flex items-center gap-2">
                      <Sparkles className="h-4 w-4 text-primary-500" />
                      Popular Searches
                    </div>
                    {["IIT Bombay", "NIT Trichy", "BITS Pilani", "Delhi NCR Colleges"].map((item, index) => (
                      <div
                        key={index}
                        className="p-3 hover:bg-primary-50 rounded-lg cursor-pointer text-slate-700 text-left transition-all hover:scale-105 animate-fade-in-up"
                        style={{ animationDelay: `${index * 0.1}s` }}
                      >
                        <Search className="h-4 w-4 inline mr-2 text-slate-400" />
                        {item}
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>
          </div>

          <div className="flex flex-wrap justify-center gap-4 animate-fade-in-up" style={{ animationDelay: "0.4s" }}>
            <Link
              href="/colleges"
              className="group relative px-6 py-3 bg-white text-slate-900 font-semibold rounded-full overflow-hidden transition-all hover:scale-105 hover:shadow-xl"
            >
              <span className="relative z-10">Browse Colleges</span>
              <div className="absolute inset-0 bg-gradient-to-r from-primary-100 to-fuchsia-100 opacity-0 group-hover:opacity-100 transition-opacity"></div>
            </Link>
            <Link
              href="/compare"
              className="group relative px-6 py-3 bg-gradient-to-r from-primary-600 to-fuchsia-600 text-white font-semibold rounded-full overflow-hidden transition-all hover:scale-105 shadow-lg shadow-black/30"
            >
              <span className="relative z-10">Compare Colleges</span>
              <div className="absolute inset-0 bg-gradient-to-r from-primary-700 to-fuchsia-700 opacity-0 group-hover:opacity-100 transition-opacity"></div>
            </Link>
            <Link
              href="/chat"
              className="group relative px-6 py-3 bg-white/15 text-white font-semibold rounded-full hover:bg-white/25 transition-all hover:scale-105 border border-white/40 backdrop-blur overflow-hidden"
            >
              <span className="relative z-10 flex items-center gap-2">
                <Sparkles className="h-4 w-4" />
                AI Counselor
              </span>
            </Link>
          </div>

          {/* Quick Stats Popup */}
          {showQuickStats && (
            <div className="mt-12 grid grid-cols-1 md:grid-cols-3 gap-4 max-w-3xl mx-auto">
              {[
                { icon: Award, label: "Top Ranked", value: "100+", color: "from-yellow-500 to-orange-500" },
                { icon: TrendingUp, label: "Avg Placement", value: "95%", color: "from-green-500 to-emerald-500" },
                { icon: Sparkles, label: "Student Rating", value: "4.8/5", color: "from-blue-500 to-cyan-500" },
              ].map((stat, index) => (
                <div
                  key={index}
                  className={`bg-gradient-to-r ${stat.color} rounded-2xl p-5 text-white shadow-2xl hover:scale-105 transition-transform cursor-pointer animate-scale-in`}
                  style={{ animationDelay: `${1 + index * 0.2}s` }}
                >
                  <stat.icon className="h-8 w-8 mb-2 mx-auto animate-pulse" />
                  <div className="text-3xl font-bold">{stat.value}</div>
                  <div className="text-sm opacity-90">{stat.label}</div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </section>
  );
}
