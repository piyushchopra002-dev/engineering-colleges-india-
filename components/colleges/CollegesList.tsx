"use client";

import { useState } from "react";
import Link from "next/link";
import { MapPin, Search, GitCompare, Star, Shield, TrendingUp, Globe } from "lucide-react";
import { CollegeImage } from "@/components/colleges/CollegeImage";
import { PulsingDot } from "@/components/ui/DecorativeElements";

interface CollegesListProps {
  colleges: Array<{
    id: string;
    name: string;
    slug: string;
    logo_url?: string;
    cover_image_url?: string;
    website?: string;
    city: string;
    state: string;
    college_type?: string;
    institution_category?: string;
    ownership_type?: string;
    established_year?: number;
  }>;
}

export function CollegesList({ colleges }: CollegesListProps) {
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedState, setSelectedState] = useState("");
  const [selectedType, setSelectedType] = useState("");
  const [compareList, setCompareList] = useState<string[]>([]);

  const toggleCompare = (e: React.MouseEvent, collegeId: string) => {
    e.preventDefault();
    e.stopPropagation();
    
    setCompareList((prev) => {
      if (prev.includes(collegeId)) {
        return prev.filter((id) => id !== collegeId);
      } else if (prev.length < 4) {
        return [...prev, collegeId];
      }
      return prev;
    });
  };

  const uniqueColleges = Array.from(
    new Map(colleges.map((college) => [college.slug || college.name, college])).values()
  );

  const states = Array.from(new Set(uniqueColleges.map((c) => c.state))).sort();
  const types = Array.from(
    new Set(
      uniqueColleges
        .flatMap((c) => [c.institution_category, c.ownership_type, c.college_type])
        .filter(Boolean)
    )
  ).sort();

  const getWebsiteHost = (website?: string) => {
    if (!website) return null;
    try {
      return new URL(website.startsWith("http") ? website : `https://${website}`).hostname;
    } catch {
      return null;
    }
  };

  const filteredColleges = uniqueColleges.filter((college) => {
    const matchesSearch =
      college.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      college.city.toLowerCase().includes(searchQuery.toLowerCase());
    const matchesState = !selectedState || college.state === selectedState;
    const matchesType =
      !selectedType ||
      college.institution_category === selectedType ||
      college.ownership_type === selectedType ||
      college.college_type === selectedType;
    return matchesSearch && matchesState && matchesType;
  });

  return (
    <div className="min-h-screen bg-slate-950 py-8 text-white relative overflow-hidden">
      {/* Grid Pattern Overlay */}
      <div className="absolute inset-0 grid-pattern pointer-events-none"></div>
      
      {/* Animated Background Elements */}
      <div className="absolute inset-0 pointer-events-none">
        {/* Large Floating Gradient Orbs */}
        <div className="absolute top-20 left-10 w-96 h-96 bg-primary-500/20 rounded-full blur-3xl animate-float animate-morph" style={{ animationDuration: "20s" }}></div>
        <div className="absolute top-40 right-20 w-80 h-80 bg-fuchsia-500/15 rounded-full blur-3xl animate-float" style={{ animationDelay: "5s", animationDuration: "25s" }}></div>
        <div className="absolute bottom-32 left-1/4 w-72 h-72 bg-blue-500/15 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "10s", animationDuration: "18s" }}></div>
        <div className="absolute bottom-20 right-1/3 w-64 h-64 bg-purple-500/10 rounded-full blur-3xl animate-float" style={{ animationDelay: "3s", animationDuration: "22s" }}></div>
        <div className="absolute top-1/2 left-1/2 w-56 h-56 bg-pink-500/15 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "7s", animationDuration: "16s" }}></div>
        
        {/* Animated Gradient Lines */}
        <div className="absolute top-0 left-1/4 w-px h-full bg-gradient-to-b from-transparent via-primary-500/20 to-transparent animate-pulse" style={{ animationDuration: "4s" }}></div>
        <div className="absolute top-0 right-1/3 w-px h-full bg-gradient-to-b from-transparent via-fuchsia-500/20 to-transparent animate-pulse" style={{ animationDelay: "2s", animationDuration: "4s" }}></div>
        
        {/* Rotating Rings */}
        <div className="absolute top-1/4 right-1/4 w-64 h-64 border border-primary-500/10 rounded-full animate-rotate-slow"></div>
        <div className="absolute bottom-1/4 left-1/4 w-48 h-48 border border-fuchsia-500/10 rounded-full animate-rotate-slow" style={{ animationDirection: "reverse", animationDuration: "30s" }}></div>
        
        {/* Aurora Effect Layers */}
        <div className="absolute top-0 left-0 w-full h-1/3 bg-gradient-to-r from-primary-500/10 via-fuchsia-500/10 to-blue-500/10 animate-aurora" style={{ animationDuration: "20s" }}></div>
        <div className="absolute bottom-0 left-0 w-full h-1/3 bg-gradient-to-r from-blue-500/10 via-purple-500/10 to-pink-500/10 animate-aurora" style={{ animationDelay: "10s", animationDuration: "25s" }}></div>
      </div>
      
      <div className="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-4xl font-bold text-white mb-8">
          All Engineering Colleges in India
        </h1>

        {/* Filters */}
        <div className="bg-white/10 border border-white/20 rounded-lg shadow-md p-6 mb-8">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-slate-400" />
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Search colleges..."
                className="w-full pl-10 pr-4 py-2 h-10 border border-white/10 rounded-lg bg-slate-950/90 text-white placeholder:text-slate-500 focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              />
            </div>
            <select
              value={selectedState}
              onChange={(e) => setSelectedState(e.target.value)}
              className="px-4 py-2 h-10 border border-white/10 rounded-lg bg-slate-950/90 text-white focus:ring-2 focus:ring-primary-500"
            >
              <option value="">All States</option>
              {states.map((state) => (
                <option key={state} value={state}>
                  {state}
                </option>
              ))}
            </select>
            <select
              value={selectedType}
              onChange={(e) => setSelectedType(e.target.value)}
              className="px-4 py-2 h-10 border border-white/10 rounded-lg bg-slate-950/90 text-white focus:ring-2 focus:ring-primary-500"
            >
              <option value="">All Types</option>
              {types.map((type) => (
                <option key={type} value={type}>
                  {type}
                </option>
              ))}
            </select>
          </div>
          <div className="mt-4 text-sm text-slate-300">
            Showing {filteredColleges.length} of {uniqueColleges.length} colleges
          </div>
        </div>

        {/* Colleges Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredColleges.map((college, index) => {
            const imageUrl = college.logo_url;
            const websiteHost = getWebsiteHost(college.website);
            const fallbacks = [
              college.cover_image_url,
              websiteHost ? `https://logo.clearbit.com/${websiteHost}?size=512` : null,
              websiteHost
                ? `https://www.google.com/s2/favicons?domain=${websiteHost}&sz=512`
                : null,
            ].filter(Boolean) as string[];
            const isInCompare = compareList.includes(college.id);
            
            return (
            <div 
              key={college.id} 
              className="relative group animate-fade-in-up"
              style={{ animationDelay: `${(index % 12) * 0.05}s` }}
            >
              <Link
                href={`/colleges/${college.slug}`}
                className="block bg-white/10 border border-white/20 rounded-lg shadow-md hover:shadow-xl hover:border-primary-500/50 overflow-hidden card-lift card-shimmer relative"
              >
                {/* Trust Indicators */}
                <div className="absolute top-2 left-2 z-10 flex gap-2">
                  <div className="flex items-center gap-1 bg-green-500 text-white text-xs px-2 py-1 rounded-full font-medium shadow-lg">
                    <Shield className="h-3 w-3" />
                    <span>Verified</span>
                  </div>
                  {index < 3 && (
                    <div className="flex items-center gap-1 bg-orange-500 text-white text-xs px-2 py-1 rounded-full font-medium shadow-lg">
                      <TrendingUp className="h-3 w-3" />
                      <span>Popular</span>
                    </div>
                  )}
                </div>
                
                <div className="aspect-video bg-white/90 relative overflow-hidden">
                  <CollegeImage
                    src={imageUrl}
                    alt={college.name}
                    className="w-full h-full object-contain p-4 group-hover:scale-105 transition-transform duration-300"
                    fallbacks={fallbacks}
                  />
                </div>
                <div className="p-4">
                  <h3 className="font-semibold text-white mb-2 group-hover:text-primary-300 transition-colors line-clamp-2">
                    {college.name}
                  </h3>
                  <button
                    onClick={(e) => {
                      e.preventDefault();
                      e.stopPropagation();
                      window.open(`https://www.google.com/maps/search/${encodeURIComponent(college.name + ', ' + college.city + ', ' + college.state)}`, '_blank', 'noopener,noreferrer');
                    }}
                    className="flex items-center text-sm text-slate-300 mb-2 hover:text-primary-400 transition-colors w-fit group cursor-pointer"
                    title="Open location in Google Maps"
                    type="button"
                  >
                    <MapPin className="h-4 w-4 mr-1 group-hover:text-primary-400" />
                    <span className="group-hover:underline">
                      {college.city}, {college.state}
                    </span>
                  </button>
                  <div className="flex items-center justify-between flex-wrap gap-2">
                    <div className="flex flex-wrap items-center gap-2">
                      {(college.institution_category || college.ownership_type || college.college_type) && (
                        <span className="px-2 py-1 text-xs font-medium bg-white/15 text-white rounded">
                          {college.institution_category || college.ownership_type || college.college_type}
                        </span>
                      )}
                      {college.website && (
                        <button
                          onClick={(e) => {
                            e.preventDefault();
                            e.stopPropagation();
                            window.open(college.website?.startsWith('http') ? college.website : `https://${college.website}`, '_blank', 'noopener,noreferrer');
                          }}
                          className="flex items-center gap-1 px-2 py-1 text-xs text-slate-300 hover:text-primary-400 bg-white/5 hover:bg-white/10 rounded transition-colors"
                          title="Visit website"
                          type="button"
                        >
                          <Globe className="h-3 w-3" />
                          <span>Website</span>
                        </button>
                      )}
                    </div>
                    {college.established_year && (
                      <span className="text-xs text-slate-400">
                        Est. {college.established_year}
                      </span>
                    )}
                  </div>
                  <div className="flex items-center gap-2 mt-2 text-xs text-slate-400">
                    <PulsingDot color="green" />
                    <span>Data Updated</span>
                  </div>
                </div>
              </Link>

              {/* Quick Compare Button */}
              <button
                onClick={(e) => toggleCompare(e, college.id)}
                className={`absolute top-3 right-3 p-2 rounded-lg backdrop-blur transition-all opacity-0 group-hover:opacity-100 ${
                  isInCompare
                    ? "bg-primary-500 text-white"
                    : "bg-white/90 text-gray-800 hover:bg-primary-500 hover:text-white"
                }`}
                title={isInCompare ? "Remove from compare" : "Add to compare"}
              >
                <GitCompare className="h-4 w-4" />
              </button>
            </div>
          );
          })}
        </div>

        {filteredColleges.length === 0 && (
          <div className="text-center py-12">
            <p className="text-slate-300 text-lg">No colleges found matching your criteria.</p>
          </div>
        )}
      </div>

      {/* Floating Compare Bar */}
      {compareList.length > 0 && (
        <div className="fixed bottom-6 left-1/2 transform -translate-x-1/2 z-50 animate-fade-in-up">
          <div className="bg-gradient-to-r from-primary-600 to-fuchsia-600 rounded-full shadow-2xl px-6 py-4 flex items-center gap-4 backdrop-blur border border-white/20">
            <div className="flex items-center gap-2 text-white font-semibold">
              <GitCompare className="h-5 w-5" />
              <span>{compareList.length} selected</span>
            </div>
            {compareList.length >= 2 && (
              <Link
                href={`/compare?colleges=${compareList.join(",")}`}
                className="px-4 py-2 bg-white text-primary-600 font-semibold rounded-full hover:bg-gray-100 transition-all"
              >
                Compare Now
              </Link>
            )}
            <button
              onClick={() => setCompareList([])}
              className="px-4 py-2 bg-white/20 text-white rounded-full hover:bg-white/30 transition-all"
            >
              Clear
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
