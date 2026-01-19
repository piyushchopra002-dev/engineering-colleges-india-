"use client";

import Link from "next/link";
import { MapPin, GitCompare, Shield, Globe } from "lucide-react";
import { CollegeImage } from "@/components/colleges/CollegeImage";
import { useState } from "react";
import { VerifiedBadge } from "@/components/ui/TrustBadges";
import { motion } from "framer-motion";
import { InteractiveCard, StaggerContainer, StaggerItem } from "@/components/ui/AnimatedElements";

interface FeaturedCollegesProps {
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
  }>;
}

export function FeaturedColleges({ colleges }: FeaturedCollegesProps) {
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

  if (colleges.length === 0) {
    return (
      <section className="py-16 bg-transparent">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-white mb-8 text-center">
            Featured Engineering Colleges
          </h2>
          <div className="text-center py-12">
            <p className="text-slate-200 text-lg mb-4">No colleges found in database</p>
            <p className="text-slate-300 mb-4">To add colleges, run the seed data SQL in Supabase:</p>
            <div className="bg-white/10 border border-white/10 p-4 rounded-lg text-left max-w-2xl mx-auto">
              <p className="text-sm text-slate-200 mb-2">1. Open Supabase SQL Editor</p>
              <p className="text-sm text-slate-200 mb-2">2. Copy content from <code className="bg-white/10 px-1 rounded">supabase/seed-data.sql</code></p>
              <p className="text-sm text-slate-200">3. Paste and run the SQL</p>
            </div>
          </div>
        </div>
      </section>
    );
  }

  const uniqueColleges = Array.from(
    new Map(colleges.map((college) => [college.slug || college.name, college])).values()
  );

  const getWebsiteHost = (website?: string) => {
    if (!website) return null;
    try {
      return new URL(website.startsWith("http") ? website : `https://${website}`).hostname;
    } catch {
      return null;
    }
  };

  return (
    <section className="py-16 bg-transparent relative overflow-hidden">
      {/* Animated Background Shapes */}
      <div className="absolute inset-0 pointer-events-none">
        <div className="absolute top-20 right-10 w-80 h-80 bg-gradient-to-br from-primary-500/10 to-fuchsia-500/10 rounded-full blur-3xl animate-float" style={{ animationDuration: "15s" }}></div>
        <div className="absolute bottom-10 left-10 w-72 h-72 bg-gradient-to-br from-blue-500/10 to-purple-500/10 rounded-full blur-3xl animate-float" style={{ animationDelay: "3s", animationDuration: "12s" }}></div>
      </div>
      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.h2 
          className="text-3xl font-bold text-white mb-8 text-center"
          initial={{ opacity: 0, y: -20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6 }}
        >
          Featured Engineering Colleges
        </motion.h2>
        <StaggerContainer className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {uniqueColleges.map((college, index) => {
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
            <StaggerItem key={college.id}>
              <motion.div 
                className="relative group h-full"
                whileHover={{ y: -8 }}
                transition={{ duration: 0.3, ease: "easeOut" }}
              >
              <Link
                href={`/colleges/${college.slug}`}
                className="block bg-white/5 border border-white/10 rounded-xl shadow-md hover:shadow-2xl hover:border-primary-500/50 overflow-hidden backdrop-blur card-lift card-shimmer relative transition-all duration-300"
              >
                {/* Verified Badge */}
                <div className="absolute top-2 left-2 z-10">
                  <div className="flex items-center gap-1 bg-green-500 text-white text-xs px-2 py-1 rounded-full font-medium">
                    <Shield className="h-3 w-3" />
                    <span>Verified</span>
                  </div>
                </div>
                
                <div className="aspect-video bg-white/90 relative overflow-hidden">
                  <CollegeImage
                    src={imageUrl}
                    alt={college.name}
                    className="w-full h-full object-contain p-4 group-hover:scale-105 transition-transform duration-300"
                    fallbacks={fallbacks}
                    priority={index < 4}
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
                        <span className="inline-block px-2 py-1 text-xs font-medium bg-white/10 text-primary-200 rounded">
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
                    <div className="flex items-center gap-1 text-xs text-slate-400">
                      <span className="inline-flex h-2 w-2 rounded-full bg-green-400 animate-pulse"></span>
                      <span>Updated</span>
                    </div>
                  </div>
                </div>
              </Link>
              
              {/* Quick Compare Button */}
              <motion.button
                onClick={(e) => toggleCompare(e, college.id)}
                className={`absolute top-3 right-3 p-2 rounded-lg backdrop-blur transition-all opacity-0 group-hover:opacity-100 ${
                  isInCompare
                    ? "bg-primary-500 text-white"
                    : "bg-white/90 text-gray-800 hover:bg-primary-500 hover:text-white"
                }`}
                title={isInCompare ? "Remove from compare" : "Add to compare"}
                whileHover={{ scale: 1.1, rotate: 5 }}
                whileTap={{ scale: 0.9 }}
              >
                <GitCompare className="h-4 w-4" />
              </motion.button>
            </motion.div>
            </StaggerItem>
          );
          })}
        </StaggerContainer>
        <div className="text-center mt-8">
          <Link
            href="/colleges"
            className="inline-block px-6 py-3 bg-gradient-to-r from-primary-500 via-fuchsia-500 to-pink-500 text-white font-semibold rounded-lg hover:from-primary-400 hover:to-pink-400 transition-all hover:scale-105"
          >
            View All Colleges
          </Link>
        </div>
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
    </section>
  );
}
