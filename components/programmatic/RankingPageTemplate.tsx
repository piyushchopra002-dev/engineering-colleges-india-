"use client";

import { useState } from "react";
import Link from "next/link";
import { College } from "@/types";
import { RankingPageContent } from "@/lib/content-templates";
import { Trophy, TrendingUp, MapPin, Award, Download, Filter } from "lucide-react";

interface RankingPageTemplateProps {
  category: string;
  categoryDisplay: string;
  categoryDescription: string;
  rankedColleges: Array<{ college: College; rank: number }>;
  content: RankingPageContent;
  placementStats: Array<{
    college_id: string;
    average_salary?: number;
    highest_salary?: number;
  }>;
  cutoffs: Array<{
    college_id: string;
    closing_rank?: number;
  }>;
}

export function RankingPageTemplate({
  category,
  categoryDisplay,
  categoryDescription,
  rankedColleges,
  content,
  placementStats,
  cutoffs,
}: RankingPageTemplateProps) {
  const [stateFilter, setStateFilter] = useState<string>("all");
  const [typeFilter, setTypeFilter] = useState<string>("all");
  const [displayCount, setDisplayCount] = useState(20);

  // Get unique states and types
  const states = Array.from(
    new Set(rankedColleges.map((rc) => rc.college.state))
  ).sort();

  const types = Array.from(
    new Set(
      rankedColleges
        .map((rc) => rc.college.institution_category)
        .filter(Boolean)
    )
  ).sort();

  // Filter colleges
  let filteredColleges = rankedColleges;

  if (stateFilter !== "all") {
    filteredColleges = filteredColleges.filter(
      (rc) => rc.college.state === stateFilter
    );
  }

  if (typeFilter !== "all") {
    filteredColleges = filteredColleges.filter(
      (rc) => rc.college.institution_category === typeFilter
    );
  }

  const displayedColleges = filteredColleges.slice(0, displayCount);

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      {/* Hero Section */}
      <div className="bg-gradient-to-r from-yellow-500 via-orange-500 to-red-500 text-white py-16">
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-center gap-3 mb-4">
            <Trophy className="w-10 h-10" />
            <h1 className="text-4xl md:text-5xl font-bold">
              {content.heroTitle}
            </h1>
          </div>
          <p className="text-xl text-orange-50 max-w-3xl mx-auto text-center">
            {categoryDescription}
          </p>

          {/* Quick Stats */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mt-8 max-w-4xl mx-auto">
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 text-center">
              <div className="text-3xl font-bold">{rankedColleges.length}</div>
              <div className="text-sm text-orange-100">Total Colleges</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 text-center">
              <div className="text-3xl font-bold">{states.length}</div>
              <div className="text-sm text-orange-100">States</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 text-center">
              <div className="text-3xl font-bold">{types.length}</div>
              <div className="text-sm text-orange-100">Categories</div>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4 text-center">
              <div className="text-3xl font-bold">2024</div>
              <div className="text-sm text-orange-100">Latest Data</div>
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

        {/* Ranking Methodology */}
        <section className="mb-12 bg-blue-50 rounded-xl p-8">
          <h2 className="text-3xl font-bold mb-6">Ranking Methodology</h2>
          <div className="grid md:grid-cols-2 gap-4">
            {content.rankingMethodology.map((method, index) => (
              <div key={index} className="flex items-start gap-3">
                <div className="w-8 h-8 rounded-full bg-blue-600 text-white flex items-center justify-center flex-shrink-0 font-bold">
                  {index + 1}
                </div>
                <p className="text-gray-700 pt-1">{method}</p>
              </div>
            ))}
          </div>
        </section>

        {/* Filters */}
        <section className="mb-8">
          <div className="flex flex-col md:flex-row gap-4 items-start md:items-center justify-between bg-white rounded-xl p-6 shadow-sm border border-gray-200">
            <div className="flex items-center gap-2">
              <Filter className="w-5 h-5 text-gray-600" />
              <span className="font-semibold text-gray-700">Filter Rankings:</span>
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

              {/* Type Filter */}
              <select
                value={typeFilter}
                onChange={(e) => setTypeFilter(e.target.value)}
                className="bg-white border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="all">All Types</option>
                {types.map((type) => (
                  <option key={type} value={type}>
                    {type}
                  </option>
                ))}
              </select>

              {/* Download Button */}
              <button className="flex items-center gap-2 bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition-colors">
                <Download className="w-4 h-4" />
                Download
              </button>
            </div>
          </div>
        </section>

        {/* Rankings Table */}
        <section className="mb-12">
          <div className="bg-white rounded-xl shadow-lg overflow-hidden border border-gray-200">
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gradient-to-r from-orange-50 to-yellow-50">
                  <tr>
                    <th className="px-6 py-4 text-left font-bold text-gray-700">
                      Rank
                    </th>
                    <th className="px-6 py-4 text-left font-bold text-gray-700">
                      College
                    </th>
                    <th className="px-6 py-4 text-left font-bold text-gray-700">
                      Location
                    </th>
                    <th className="px-6 py-4 text-center font-bold text-gray-700">
                      Avg Placement
                    </th>
                    <th className="px-6 py-4 text-center font-bold text-gray-700">
                      Cutoff Rank
                    </th>
                    <th className="px-6 py-4 text-center font-bold text-gray-700">
                      Action
                    </th>
                  </tr>
                </thead>
                <tbody>
                  {displayedColleges.map((item, index) => {
                    const placement = placementStats.find(
                      (p) => p.college_id === item.college.id
                    );
                    const cutoff = cutoffs.find(
                      (c) => c.college_id === item.college.id
                    );

                    return (
                      <tr
                        key={item.college.id}
                        className={`border-t border-gray-200 hover:bg-gray-50 transition-colors ${
                          index < 3 ? "bg-yellow-50" : ""
                        }`}
                      >
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-2">
                            {index < 3 && (
                              <Trophy
                                className={`w-5 h-5 ${
                                  index === 0
                                    ? "text-yellow-500"
                                    : index === 1
                                    ? "text-gray-400"
                                    : "text-orange-600"
                                }`}
                              />
                            )}
                            <span className="font-bold text-lg">
                              #{index + 1}
                            </span>
                          </div>
                        </td>
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-3">
                            {item.college.logo_url && (
                              <img
                                src={item.college.logo_url}
                                alt={item.college.name}
                                className="w-10 h-10 object-contain"
                              />
                            )}
                            <div>
                              <Link
                                href={`/colleges/${item.college.slug}`}
                                className="font-semibold text-blue-600 hover:underline"
                              >
                                {item.college.name}
                              </Link>
                              {item.college.institution_category && (
                                <div className="text-xs text-gray-500">
                                  {item.college.institution_category}
                                </div>
                              )}
                            </div>
                          </div>
                        </td>
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-1 text-gray-600">
                            <MapPin className="w-4 h-4" />
                            <span className="text-sm">
                              {item.college.city}, {item.college.state}
                            </span>
                          </div>
                        </td>
                        <td className="px-6 py-4 text-center">
                          {placement?.average_salary ? (
                            <span className="font-semibold text-green-600">
                              ₹{(placement.average_salary / 100000).toFixed(1)} LPA
                            </span>
                          ) : (
                            <span className="text-gray-400">N/A</span>
                          )}
                        </td>
                        <td className="px-6 py-4 text-center">
                          {cutoff?.closing_rank ? (
                            <span className="font-semibold">
                              {cutoff.closing_rank.toLocaleString()}
                            </span>
                          ) : (
                            <span className="text-gray-400">N/A</span>
                          )}
                        </td>
                        <td className="px-6 py-4 text-center">
                          <Link
                            href={`/colleges/${item.college.slug}`}
                            className="inline-block bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors text-sm font-medium"
                          >
                            View Details
                          </Link>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          </div>

          {/* Load More */}
          {displayCount < filteredColleges.length && (
            <div className="text-center mt-6">
              <button
                onClick={() => setDisplayCount(displayCount + 20)}
                className="bg-blue-600 text-white px-8 py-3 rounded-lg hover:bg-blue-700 transition-colors font-semibold"
              >
                Load More ({filteredColleges.length - displayCount} remaining)
              </button>
            </div>
          )}
        </section>

        {/* How to Use */}
        <section className="mb-12 bg-gradient-to-r from-purple-50 to-blue-50 rounded-xl p-8">
          <h2 className="text-3xl font-bold mb-6">How to Use This Ranking</h2>
          <p className="text-gray-700 leading-relaxed">{content.howToUse}</p>
        </section>

        {/* Related Links */}
        <section className="bg-gray-50 rounded-xl p-8">
          <h2 className="text-2xl font-bold mb-6">Explore Other Rankings</h2>
          <div className="grid md:grid-cols-3 gap-4">
            <Link
              href="/rankings/nirf-top-100"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              NIRF Top 100 →
            </Link>
            <Link
              href="/rankings/iit-rankings"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              IIT Rankings →
            </Link>
            <Link
              href="/rankings/nit-rankings"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              NIT Rankings →
            </Link>
            <Link
              href="/rankings/placement-salary"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              Best Placements →
            </Link>
            <Link
              href="/compare"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              Compare Colleges →
            </Link>
            <Link
              href="/colleges"
              className="text-blue-600 hover:text-blue-700 hover:underline"
            >
              All Colleges →
            </Link>
          </div>
        </section>
      </div>
    </div>
  );
}
