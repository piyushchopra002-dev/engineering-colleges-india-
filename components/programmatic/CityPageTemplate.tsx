"use client";

import { useState } from "react";
import Link from "next/link";
import { College } from "@/types";
import { CityPageContent } from "@/lib/content-templates";
import { CollegeCard } from "@/components/colleges/CollegeCard";
import { MapPin, TrendingUp, Award, Users, Building2, ChevronDown } from "lucide-react";

interface CityPageTemplateProps {
  city: string;
  state: string;
  colleges: College[];
  content: CityPageContent;
  placementStats: Array<{
    college_id: string;
    average_salary?: number;
    highest_salary?: number;
    placement_percentage?: number;
  }>;
  cutoffs: Array<{
    college_id: string;
    closing_rank?: number;
  }>;
}

export function CityPageTemplate({
  city,
  state,
  colleges,
  content,
  placementStats,
  cutoffs,
}: CityPageTemplateProps) {
  const [filter, setFilter] = useState<string>("all");
  const [sortBy, setSortBy] = useState<string>("name");

  // Filter and sort colleges
  let filteredColleges = [...colleges];

  if (filter !== "all") {
    filteredColleges = filteredColleges.filter(
      (c) => c.institution_category === filter
    );
  }

  if (sortBy === "name") {
    filteredColleges.sort((a, b) => a.name.localeCompare(b.name));
  } else if (sortBy === "placement") {
    filteredColleges.sort((a, b) => {
      const aPlacement = placementStats.find((p) => p.college_id === a.id);
      const bPlacement = placementStats.find((p) => p.college_id === b.id);
      return (bPlacement?.average_salary || 0) - (aPlacement?.average_salary || 0);
    });
  } else if (sortBy === "cutoff") {
    filteredColleges.sort((a, b) => {
      const aCutoff = cutoffs.find((c) => c.college_id === a.id);
      const bCutoff = cutoffs.find((c) => c.college_id === b.id);
      return (aCutoff?.closing_rank || 999999) - (bCutoff?.closing_rank || 999999);
    });
  }

  // Calculate city stats
  const avgPlacement =
    placementStats.length > 0
      ? placementStats.reduce((sum, p) => sum + (p.average_salary || 0), 0) /
        placementStats.length
      : 0;

  const topPlacement =
    placementStats.length > 0
      ? Math.max(...placementStats.map((p) => p.highest_salary || 0))
      : 0;

  const avgPlacementRate =
    placementStats.length > 0
      ? placementStats.reduce((sum, p) => sum + (p.placement_percentage || 0), 0) /
        placementStats.length
      : 0;

  const categories = Array.from(
    new Set(colleges.map((c) => c.institution_category).filter(Boolean))
  );

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      {/* Hero Section */}
      <div className="bg-gradient-to-r from-blue-600 to-purple-600 text-white py-16">
        <div className="container mx-auto px-4">
          <div className="flex items-center gap-2 text-blue-100 mb-4">
            <MapPin className="w-5 h-5" />
            <span className="text-sm">{state}, India</span>
          </div>
          <h1 className="text-4xl md:text-5xl font-bold mb-4">
            {content.heroTitle}
          </h1>
          <p className="text-xl text-blue-50 max-w-3xl">
            {content.heroSubtitle}
          </p>

          {/* Quick Stats */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mt-8">
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4">
              <Building2 className="w-6 h-6 mb-2" />
              <div className="text-2xl font-bold">{colleges.length}+</div>
              <div className="text-sm text-blue-100">Colleges</div>
            </div>
            {avgPlacement > 0 && (
              <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4">
                <TrendingUp className="w-6 h-6 mb-2" />
                <div className="text-2xl font-bold">
                  ₹{(avgPlacement / 100000).toFixed(1)}L
                </div>
                <div className="text-sm text-blue-100">Avg Package</div>
              </div>
            )}
            {topPlacement > 0 && (
              <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4">
                <Award className="w-6 h-6 mb-2" />
                <div className="text-2xl font-bold">
                  ₹{(topPlacement / 100000).toFixed(1)}L
                </div>
                <div className="text-sm text-blue-100">Highest Package</div>
              </div>
            )}
            {avgPlacementRate > 0 && (
              <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4">
                <Users className="w-6 h-6 mb-2" />
                <div className="text-2xl font-bold">
                  {avgPlacementRate.toFixed(0)}%
                </div>
                <div className="text-sm text-blue-100">Placement Rate</div>
              </div>
            )}
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-12">
        {/* Introduction */}
        <section className="mb-12">
          <div className="prose max-w-none">
            <p className="text-lg text-gray-700 leading-relaxed">
              {content.introduction}
            </p>
          </div>
        </section>

        {/* Why Study Here */}
        <section className="mb-12 bg-blue-50 rounded-xl p-8">
          <h2 className="text-3xl font-bold mb-6">
            Why Study Engineering in {city}?
          </h2>
          <div className="grid md:grid-cols-2 gap-4">
            {content.whyStudyHere.map((reason, index) => (
              <div key={index} className="flex items-start gap-3">
                <div className="w-6 h-6 rounded-full bg-blue-600 text-white flex items-center justify-center flex-shrink-0 mt-1">
                  ✓
                </div>
                <p className="text-gray-700">{reason}</p>
              </div>
            ))}
          </div>
        </section>

        {/* Filters and Sorting */}
        <section className="mb-8">
          <div className="flex flex-col md:flex-row gap-4 items-start md:items-center justify-between">
            <div>
              <h2 className="text-3xl font-bold mb-2">
                All Engineering Colleges in {city}
              </h2>
              <p className="text-gray-600">{content.topCollegesIntro}</p>
            </div>

            <div className="flex flex-wrap gap-3">
              {/* Filter by Category */}
              <div className="relative">
                <select
                  value={filter}
                  onChange={(e) => setFilter(e.target.value)}
                  className="appearance-none bg-white border border-gray-300 rounded-lg px-4 py-2 pr-10 focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
                  <option value="all">All Categories</option>
                  {categories.map((cat) => (
                    <option key={cat} value={cat}>
                      {cat}
                    </option>
                  ))}
                </select>
                <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-500 pointer-events-none" />
              </div>

              {/* Sort By */}
              <div className="relative">
                <select
                  value={sortBy}
                  onChange={(e) => setSortBy(e.target.value)}
                  className="appearance-none bg-white border border-gray-300 rounded-lg px-4 py-2 pr-10 focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
                  <option value="name">Sort by Name</option>
                  <option value="placement">Sort by Placement</option>
                  <option value="cutoff">Sort by Cutoff</option>
                </select>
                <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-500 pointer-events-none" />
              </div>
            </div>
          </div>
        </section>

        {/* Colleges Grid */}
        <section className="mb-12">
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {filteredColleges.map((college) => {
              const placement = placementStats.find((p) => p.college_id === college.id);
              const cutoff = cutoffs.find((c) => c.college_id === college.id);

              return (
                <Link
                  key={college.id}
                  href={`/colleges/${college.slug}`}
                  className="block group"
                >
                  <div className="bg-white rounded-xl shadow-sm hover:shadow-xl transition-all duration-300 overflow-hidden h-full border border-gray-100 group-hover:border-blue-200">
                    {/* College Image */}
                    {college.cover_image_url && (
                      <div className="h-48 overflow-hidden">
                        <img
                          src={college.cover_image_url}
                          alt={college.name}
                          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                        />
                      </div>
                    )}

                    <div className="p-6">
                      {/* Logo and Name */}
                      <div className="flex items-start gap-3 mb-4">
                        {college.logo_url && (
                          <img
                            src={college.logo_url}
                            alt={`${college.name} logo`}
                            className="w-12 h-12 object-contain"
                          />
                        )}
                        <div className="flex-1 min-w-0">
                          <h3 className="font-bold text-lg group-hover:text-blue-600 transition-colors line-clamp-2">
                            {college.name}
                          </h3>
                          {college.institution_category && (
                            <span className="inline-block text-xs bg-blue-100 text-blue-700 px-2 py-1 rounded mt-1">
                              {college.institution_category}
                            </span>
                          )}
                        </div>
                      </div>

                      {/* Stats */}
                      <div className="space-y-2 text-sm">
                        <div className="flex justify-between">
                          <span className="text-gray-600">Avg Package:</span>
                          <span className="font-semibold">
                            {placement?.average_salary
                              ? `₹${(placement.average_salary / 100000).toFixed(1)} LPA`
                              : "N/A"}
                          </span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-gray-600">Cutoff Rank:</span>
                          <span className="font-semibold">
                            {cutoff?.closing_rank
                              ? cutoff.closing_rank.toLocaleString()
                              : "N/A"}
                          </span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-gray-600">Established:</span>
                          <span className="font-semibold">
                            {college.established_year || "N/A"}
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </Link>
              );
            })}
          </div>
        </section>

        {/* Admission Process */}
        <section className="mb-12">
          <h2 className="text-3xl font-bold mb-6">Admission Process</h2>
          <div className="bg-gradient-to-r from-purple-50 to-blue-50 rounded-xl p-8">
            <p className="text-gray-700 leading-relaxed">{content.admissionProcess}</p>
          </div>
        </section>

        {/* FAQs */}
        <section className="mb-12">
          <h2 className="text-3xl font-bold mb-6">
            Frequently Asked Questions
          </h2>
          <div className="space-y-4">
            {content.faqs.map((faq, index) => (
              <details
                key={index}
                className="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden group"
              >
                <summary className="cursor-pointer p-6 font-semibold text-lg hover:bg-gray-50 transition-colors">
                  {faq.question}
                </summary>
                <div className="px-6 pb-6 text-gray-700 leading-relaxed">
                  {faq.answer}
                </div>
              </details>
            ))}
          </div>
        </section>

        {/* Related Links */}
        <section className="bg-gray-50 rounded-xl p-8">
          <h2 className="text-2xl font-bold mb-6">Explore More</h2>
          <div className="grid md:grid-cols-3 gap-4">
            <Link
              href="/colleges"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              All Engineering Colleges →
            </Link>
            <Link
              href="/compare"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              Compare Colleges →
            </Link>
            <Link
              href="/rankings/nirf-top-100"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              NIRF Rankings →
            </Link>
          </div>
        </section>
      </div>
    </div>
  );
}
