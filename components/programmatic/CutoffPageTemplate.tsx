"use client";

import { useState } from "react";
import Link from "next/link";
import { College } from "@/types";
import { CutoffPageContent } from "@/lib/content-templates";
import {
  Target,
  TrendingUp,
  MapPin,
  Award,
  ChevronDown,
  CheckCircle2,
  AlertCircle,
} from "lucide-react";

interface CutoffPageTemplateProps {
  range: string;
  rangeDisplay: string;
  minRank: number;
  maxRank: number;
  examType: string;
  colleges: Array<
    College & {
      cutoffs: Array<{
        branch: string;
        branchFull: string;
        closing_rank?: number;
        opening_rank?: number;
      }>;
    }
  >;
  content: CutoffPageContent;
  placementStats: Array<{
    college_id: string;
    average_salary?: number;
    highest_salary?: number;
  }>;
}

export function CutoffPageTemplate({
  range,
  rangeDisplay,
  minRank,
  maxRank,
  examType,
  colleges,
  content,
  placementStats,
}: CutoffPageTemplateProps) {
  const [stateFilter, setStateFilter] = useState<string>("all");
  const [branchFilter, setBranchFilter] = useState<string>("all");
  const [sortBy, setSortBy] = useState<string>("cutoff");

  // Get unique states and branches
  const states = Array.from(new Set(colleges.map((c) => c.state))).sort();
  const branches = Array.from(
    new Set(colleges.flatMap((c) => c.cutoffs.map((cu) => cu.branch)))
  ).sort();

  // Filter colleges
  let filteredColleges = [...colleges];

  if (stateFilter !== "all") {
    filteredColleges = filteredColleges.filter((c) => c.state === stateFilter);
  }

  if (branchFilter !== "all") {
    filteredColleges = filteredColleges.filter((c) =>
      c.cutoffs.some((cu) => cu.branch === branchFilter)
    );
  }

  // Sort colleges
  if (sortBy === "cutoff") {
    filteredColleges.sort((a, b) => {
      const aMin = Math.min(...a.cutoffs.map((c) => c.closing_rank || 999999));
      const bMin = Math.min(...b.cutoffs.map((c) => c.closing_rank || 999999));
      return aMin - bMin;
    });
  } else if (sortBy === "placement") {
    filteredColleges.sort((a, b) => {
      const aPlacement = placementStats.find((p) => p.college_id === a.id);
      const bPlacement = placementStats.find((p) => p.college_id === b.id);
      return (
        (bPlacement?.average_salary || 0) - (aPlacement?.average_salary || 0)
      );
    });
  }

  // Calculate admission chances
  const getAdmissionChance = (collegeRank: number, userRank: number): string => {
    if (userRank <= collegeRank * 0.8) return "High";
    if (userRank <= collegeRank) return "Moderate";
    if (userRank <= collegeRank * 1.2) return "Low";
    return "Very Low";
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      {/* Hero Section */}
      <div className="bg-gradient-to-r from-green-600 via-teal-600 to-blue-600 text-white py-16">
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-center gap-3 mb-4">
            <Target className="w-10 h-10" />
            <h1 className="text-4xl md:text-5xl font-bold">
              {content.heroTitle}
            </h1>
          </div>
          <p className="text-xl text-green-50 max-w-3xl mx-auto text-center">
            Find the best engineering colleges for your {examType} rank
          </p>

          {/* Quick Stats */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mt-8 max-w-4xl mx-auto">
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 text-center">
              <div className="text-3xl font-bold">{colleges.length}</div>
              <div className="text-sm text-green-100">Eligible Colleges</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 text-center">
              <div className="text-3xl font-bold">{rangeDisplay}</div>
              <div className="text-sm text-green-100">Rank Range</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 text-center">
              <div className="text-3xl font-bold">{branches.length}+</div>
              <div className="text-sm text-green-100">Branches</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 text-center">
              <div className="text-3xl font-bold">2024</div>
              <div className="text-sm text-green-100">Latest Cutoffs</div>
            </div>
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

        {/* Admission Tips */}
        <section className="mb-12 bg-blue-50 rounded-xl p-8">
          <h2 className="text-3xl font-bold mb-6">Admission Tips</h2>
          <div className="grid md:grid-cols-2 gap-4">
            {content.admissionTips.map((tip, index) => (
              <div key={index} className="flex items-start gap-3">
                <CheckCircle2 className="w-5 h-5 text-blue-600 flex-shrink-0 mt-1" />
                <p className="text-gray-700">{tip}</p>
              </div>
            ))}
          </div>
        </section>

        {/* Filters */}
        <section className="mb-8">
          <div className="flex flex-col md:flex-row gap-4 items-start md:items-center justify-between bg-white rounded-xl p-6 shadow-sm border border-gray-200">
            <div>
              <h2 className="text-2xl font-bold mb-1">Eligible Colleges</h2>
              <p className="text-gray-600">{content.eligibleColleges}</p>
            </div>

            <div className="flex flex-wrap gap-3">
              {/* State Filter */}
              <select
                value={stateFilter}
                onChange={(e) => setStateFilter(e.target.value)}
                className="bg-white border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="all">All States</option>
                {states.map((state) => (
                  <option key={state} value={state}>
                    {state}
                  </option>
                ))}
              </select>

              {/* Branch Filter */}
              <select
                value={branchFilter}
                onChange={(e) => setBranchFilter(e.target.value)}
                className="bg-white border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="all">All Branches</option>
                {branches.map((branch) => (
                  <option key={branch} value={branch}>
                    {branch}
                  </option>
                ))}
              </select>

              {/* Sort By */}
              <select
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value)}
                className="bg-white border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="cutoff">Sort by Cutoff</option>
                <option value="placement">Sort by Placement</option>
                <option value="name">Sort by Name</option>
              </select>
            </div>
          </div>
        </section>

        {/* Colleges List */}
        <section className="mb-12">
          <div className="space-y-6">
            {filteredColleges.map((college) => {
              const placement = placementStats.find(
                (p) => p.college_id === college.id
              );
              const bestCutoff = Math.min(
                ...college.cutoffs.map((c) => c.closing_rank || 999999)
              );

              return (
                <div
                  key={college.id}
                  className="bg-white rounded-xl shadow-sm hover:shadow-lg transition-all duration-300 overflow-hidden border border-gray-200"
                >
                  <div className="p-6">
                    {/* College Header */}
                    <div className="flex flex-col md:flex-row md:items-start gap-4 mb-4">
                      <div className="flex items-start gap-4 flex-1">
                        {college.logo_url && (
                          <img
                            src={college.logo_url}
                            alt={college.name}
                            className="w-16 h-16 object-contain"
                          />
                        )}
                        <div className="flex-1 min-w-0">
                          <Link
                            href={`/colleges/${college.slug}`}
                            className="text-xl font-bold text-blue-600 hover:underline block mb-1"
                          >
                            {college.name}
                          </Link>
                          <div className="flex flex-wrap items-center gap-3 text-sm text-gray-600">
                            <div className="flex items-center gap-1">
                              <MapPin className="w-4 h-4" />
                              {college.city}, {college.state}
                            </div>
                            {college.institution_category && (
                              <span className="bg-blue-100 text-blue-700 px-2 py-1 rounded">
                                {college.institution_category}
                              </span>
                            )}
                          </div>
                        </div>
                      </div>

                      {/* Quick Stats */}
                      <div className="flex gap-4">
                        {placement?.average_salary && (
                          <div className="text-center">
                            <div className="text-sm text-gray-600">
                              Avg Package
                            </div>
                            <div className="text-lg font-bold text-green-600">
                              ₹{(placement.average_salary / 100000).toFixed(1)}L
                            </div>
                          </div>
                        )}
                        <div className="text-center">
                          <div className="text-sm text-gray-600">Best Cutoff</div>
                          <div className="text-lg font-bold">
                            {bestCutoff.toLocaleString()}
                          </div>
                        </div>
                      </div>
                    </div>

                    {/* Branch Cutoffs */}
                    <div className="border-t border-gray-200 pt-4">
                      <h4 className="font-semibold mb-3">
                        Available Branches & Cutoffs:
                      </h4>
                      <div className="grid md:grid-cols-2 gap-3">
                        {college.cutoffs
                          .filter((cu) =>
                            branchFilter === "all"
                              ? true
                              : cu.branch === branchFilter
                          )
                          .slice(0, 6)
                          .map((cutoff, index) => {
                            const chance = getAdmissionChance(
                              cutoff.closing_rank || 999999,
                              maxRank
                            );
                            return (
                              <div
                                key={index}
                                className="flex items-center justify-between bg-gray-50 rounded-lg p-3"
                              >
                                <div>
                                  <div className="font-medium text-sm">
                                    {cutoff.branchFull}
                                  </div>
                                  <div className="text-xs text-gray-600">
                                    Closing: {cutoff.closing_rank?.toLocaleString()}
                                  </div>
                                </div>
                                <div
                                  className={`text-xs font-semibold px-2 py-1 rounded ${
                                    chance === "High"
                                      ? "bg-green-100 text-green-700"
                                      : chance === "Moderate"
                                      ? "bg-yellow-100 text-yellow-700"
                                      : "bg-red-100 text-red-700"
                                  }`}
                                >
                                  {chance}
                                </div>
                              </div>
                            );
                          })}
                      </div>
                      {college.cutoffs.length > 6 && (
                        <Link
                          href={`/colleges/${college.slug}`}
                          className="text-blue-600 hover:underline text-sm mt-2 inline-block"
                        >
                          View all {college.cutoffs.length} branches →
                        </Link>
                      )}
                    </div>

                    {/* Action Button */}
                    <div className="mt-4 pt-4 border-t border-gray-200">
                      <Link
                        href={`/colleges/${college.slug}`}
                        className="inline-block bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition-colors font-medium"
                      >
                        View Full Details
                      </Link>
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        </section>

        {/* Important Dates */}
        <section className="mb-12 bg-yellow-50 rounded-xl p-8 border-l-4 border-yellow-500">
          <div className="flex items-start gap-3">
            <AlertCircle className="w-6 h-6 text-yellow-600 flex-shrink-0 mt-1" />
            <div>
              <h2 className="text-2xl font-bold mb-3">Important Dates</h2>
              <p className="text-gray-700 leading-relaxed">
                {content.importantDates}
              </p>
            </div>
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
          <h2 className="text-2xl font-bold mb-6">Explore Other Rank Ranges</h2>
          <div className="grid md:grid-cols-3 gap-4">
            <Link
              href="/cutoffs/under-1000"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              Rank Under 1000 →
            </Link>
            <Link
              href="/cutoffs/1000-5000"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              Rank 1000-5000 →
            </Link>
            <Link
              href="/cutoffs/5000-10000"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              Rank 5000-10000 →
            </Link>
            <Link
              href="/cutoffs/10000-20000"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              Rank 10000-20000 →
            </Link>
            <Link
              href="/rankings/nirf-top-100"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              NIRF Rankings →
            </Link>
            <Link
              href="/compare"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              Compare Colleges →
            </Link>
          </div>
        </section>
      </div>
    </div>
  );
}
