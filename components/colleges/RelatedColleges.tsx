"use client";

import Link from "next/link";
import { MapPin, TrendingUp, Globe } from "lucide-react";
import { CollegeImage } from "./CollegeImage";
import { useEffect, useState } from "react";
import { createSupabaseClient } from "@/lib/supabase/client";

interface College {
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
}

interface RelatedCollegesProps {
  currentCollegeId: string;
  city: string;
  state: string;
  collegeType?: string;
  institutionCategory?: string;
  ownershipType?: string;
}

export function RelatedColleges({
  currentCollegeId,
  city,
  state,
  collegeType,
  institutionCategory,
  ownershipType,
}: RelatedCollegesProps) {
  const [colleges, setColleges] = useState<College[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchRelated() {
      const supabase = createSupabaseClient();
      
      // First try to get colleges from the same city and category
      let query = supabase
        .from("colleges")
        .select("id, name, slug, logo_url, cover_image_url, website, city, state, college_type, institution_category, ownership_type")
        .eq("city", city)
        .neq("id", currentCollegeId);

      // Filter by category (prioritize ownership_type, then institution_category, then college_type)
      if (ownershipType) {
        query = query.eq("ownership_type", ownershipType);
      } else if (institutionCategory) {
        query = query.eq("institution_category", institutionCategory);
      } else if (collegeType) {
        query = query.eq("college_type", collegeType);
      }

      let { data: cityColleges } = await query.limit(4);

      if (cityColleges && cityColleges.length >= 4) {
        setColleges(cityColleges as College[]);
        setLoading(false);
        return;
      }

      // If not enough, get from same state and category
      let stateQuery = supabase
        .from("colleges")
        .select("id, name, slug, logo_url, cover_image_url, website, city, state, college_type, institution_category, ownership_type")
        .eq("state", state)
        .neq("id", currentCollegeId);

      // Apply same category filter
      if (ownershipType) {
        stateQuery = stateQuery.eq("ownership_type", ownershipType);
      } else if (institutionCategory) {
        stateQuery = stateQuery.eq("institution_category", institutionCategory);
      } else if (collegeType) {
        stateQuery = stateQuery.eq("college_type", collegeType);
      }

      const { data: stateColleges } = await stateQuery.limit(4);

      setColleges((stateColleges || []) as College[]);
      setLoading(false);
    }

    fetchRelated();
  }, [currentCollegeId, city, state, collegeType, institutionCategory, ownershipType]);

  const getWebsiteHost = (website?: string) => {
    if (!website) return null;
    try {
      return new URL(website.startsWith("http") ? website : `https://${website}`).hostname;
    } catch {
      return null;
    }
  };

  if (loading) {
    return (
      <section className="bg-white rounded-lg shadow-md p-6">
        <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center">
          <TrendingUp className="h-6 w-6 mr-2 text-primary-600" />
          Similar Colleges
        </h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {[1, 2, 3, 4].map((i) => (
            <div key={i} className="animate-pulse">
              <div className="aspect-video bg-gray-200 rounded-lg mb-3"></div>
              <div className="h-4 bg-gray-200 rounded mb-2"></div>
              <div className="h-3 bg-gray-200 rounded w-2/3"></div>
            </div>
          ))}
        </div>
      </section>
    );
  }

  if (colleges.length === 0) {
    return null;
  }

  return (
    <section className="bg-white rounded-lg shadow-md p-6">
      <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center">
        <TrendingUp className="h-6 w-6 mr-2 text-primary-600" />
        Similar Colleges
      </h2>
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {colleges.map((college) => {
          const websiteHost = getWebsiteHost(college.website);
          const fallbacks = [
            college.cover_image_url,
            websiteHost ? `https://logo.clearbit.com/${websiteHost}?size=512` : null,
            websiteHost ? `https://www.google.com/s2/favicons?domain=${websiteHost}&sz=512` : null,
          ].filter(Boolean) as string[];

          return (
            <Link
              key={college.id}
              href={`/colleges/${college.slug}`}
              className="group bg-gray-50 rounded-lg overflow-hidden hover:shadow-lg transition-all border border-gray-200 hover:border-primary-300"
            >
              <div className="aspect-video bg-white relative">
                <CollegeImage
                  src={college.logo_url}
                  alt={college.name}
                  className="w-full h-full object-contain p-3 group-hover:scale-105 transition-transform"
                  fallbacks={fallbacks}
                />
              </div>
              <div className="p-3">
                <h3 className="font-semibold text-gray-900 mb-1 line-clamp-2 text-sm group-hover:text-primary-600 transition-colors">
                  {college.name}
                </h3>
                <button
                  onClick={(e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    window.open(`https://www.google.com/maps/search/${encodeURIComponent(college.name + ', ' + college.city + ', ' + college.state)}`, '_blank', 'noopener,noreferrer');
                  }}
                  className="flex items-center text-xs text-gray-600 hover:text-primary-600 transition-colors w-fit group cursor-pointer"
                  title="Open location in Google Maps"
                  type="button"
                >
                  <MapPin className="h-3 w-3 mr-1 group-hover:text-primary-600" />
                  <span className="truncate group-hover:underline">
                    {college.city}, {college.state}
                  </span>
                </button>
              </div>
            </Link>
          );
        })}
      </div>
    </section>
  );
}
