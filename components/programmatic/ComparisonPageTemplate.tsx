"use client";

import Link from "next/link";
import { College } from "@/types";
import { ComparisonPageContent } from "@/lib/content-templates";
import {
  Trophy,
  TrendingUp,
  Users,
  Building2,
  MapPin,
  Calendar,
  Award,
  CheckCircle2,
  XCircle,
} from "lucide-react";

interface ComparisonPageTemplateProps {
  college1: College;
  college2: College;
  content: ComparisonPageContent;
  placementStats: Array<{
    college_id: string;
    year: number;
    average_salary?: number;
    highest_salary?: number;
    placement_percentage?: number;
  }>;
  cutoffs: Array<{
    college_id: string;
    closing_rank?: number;
    category: string;
    branches?: { name: string };
  }>;
  facultyCount: Record<string, number>;
  infrastructure: Record<string, any[]>;
}

export function ComparisonPageTemplate({
  college1,
  college2,
  content,
  placementStats,
  cutoffs,
  facultyCount,
  infrastructure,
}: ComparisonPageTemplateProps) {
  const name1 = college1.short_name || college1.name;
  const name2 = college2.short_name || college2.name;

  // Get latest placement data
  const college1Placement = placementStats
    .filter((p) => p.college_id === college1.id)
    .sort((a, b) => b.year - a.year)[0];

  const college2Placement = placementStats
    .filter((p) => p.college_id === college2.id)
    .sort((a, b) => b.year - a.year)[0];

  // Get best cutoffs
  const college1Cutoff = cutoffs
    .filter((c) => c.college_id === college1.id && c.category === "General")
    .sort((a, b) => (a.closing_rank || 999999) - (b.closing_rank || 999999))[0];

  const college2Cutoff = cutoffs
    .filter((c) => c.college_id === college2.id && c.category === "General")
    .sort((a, b) => (a.closing_rank || 999999) - (b.closing_rank || 999999))[0];

  // Get NIRF rankings
  const college1Rank = (college1 as any).college_rankings?.find(
    (r: any) => r.ranking_type === "NIRF" && r.year === 2024
  )?.rank;

  const college2Rank = (college2 as any).college_rankings?.find(
    (r: any) => r.ranking_type === "NIRF" && r.year === 2024
  )?.rank;

  // Comparison data
  const comparisonData = [
    {
      category: "NIRF Ranking 2024",
      college1Value: college1Rank ? `#${college1Rank}` : "N/A",
      college2Value: college2Rank ? `#${college2Rank}` : "N/A",
      winner:
        college1Rank && college2Rank
          ? college1Rank < college2Rank
            ? 1
            : 2
          : null,
    },
    {
      category: "Established Year",
      college1Value: college1.established_year || "N/A",
      college2Value: college2.established_year || "N/A",
      winner: null,
    },
    {
      category: "Location",
      college1Value: `${college1.city}, ${college1.state}`,
      college2Value: `${college2.city}, ${college2.state}`,
      winner: null,
    },
    {
      category: "Institution Type",
      college1Value: college1.institution_category || "N/A",
      college2Value: college2.institution_category || "N/A",
      winner: null,
    },
    {
      category: "Average Placement",
      college1Value: college1Placement?.average_salary
        ? `₹${(college1Placement.average_salary / 100000).toFixed(1)} LPA`
        : "N/A",
      college2Value: college2Placement?.average_salary
        ? `₹${(college2Placement.average_salary / 100000).toFixed(1)} LPA`
        : "N/A",
      winner:
        college1Placement?.average_salary && college2Placement?.average_salary
          ? college1Placement.average_salary > college2Placement.average_salary
            ? 1
            : 2
          : null,
    },
    {
      category: "Highest Placement",
      college1Value: college1Placement?.highest_salary
        ? `₹${(college1Placement.highest_salary / 100000).toFixed(1)} LPA`
        : "N/A",
      college2Value: college2Placement?.highest_salary
        ? `₹${(college2Placement.highest_salary / 100000).toFixed(1)} LPA`
        : "N/A",
      winner:
        college1Placement?.highest_salary && college2Placement?.highest_salary
          ? college1Placement.highest_salary > college2Placement.highest_salary
            ? 1
            : 2
          : null,
    },
    {
      category: "Placement Rate",
      college1Value: college1Placement?.placement_percentage
        ? `${college1Placement.placement_percentage.toFixed(0)}%`
        : "N/A",
      college2Value: college2Placement?.placement_percentage
        ? `${college2Placement.placement_percentage.toFixed(0)}%`
        : "N/A",
      winner:
        college1Placement?.placement_percentage &&
        college2Placement?.placement_percentage
          ? college1Placement.placement_percentage >
            college2Placement.placement_percentage
            ? 1
            : 2
          : null,
    },
    {
      category: "Best Cutoff Rank",
      college1Value: college1Cutoff?.closing_rank
        ? college1Cutoff.closing_rank.toLocaleString()
        : "N/A",
      college2Value: college2Cutoff?.closing_rank
        ? college2Cutoff.closing_rank.toLocaleString()
        : "N/A",
      winner:
        college1Cutoff?.closing_rank && college2Cutoff?.closing_rank
          ? college1Cutoff.closing_rank < college2Cutoff.closing_rank
            ? 1
            : 2
          : null,
    },
    {
      category: "Faculty Count",
      college1Value: facultyCount[college1.id] || "N/A",
      college2Value: facultyCount[college2.id] || "N/A",
      winner:
        facultyCount[college1.id] && facultyCount[college2.id]
          ? facultyCount[college1.id] > facultyCount[college2.id]
            ? 1
            : 2
          : null,
    },
  ];

  // Calculate winner count
  const college1Wins = comparisonData.filter((d) => d.winner === 1).length;
  const college2Wins = comparisonData.filter((d) => d.winner === 2).length;

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      {/* Hero Section */}
      <div className="bg-gradient-to-r from-blue-600 via-purple-600 to-pink-600 text-white py-16">
        <div className="container mx-auto px-4">
          <h1 className="text-4xl md:text-5xl font-bold mb-4 text-center">
            {content.heroTitle}
          </h1>
          <p className="text-xl text-blue-50 max-w-3xl mx-auto text-center">
            Make an informed decision with our detailed head-to-head comparison
          </p>

          {/* College Cards */}
          <div className="grid md:grid-cols-2 gap-6 mt-12 max-w-5xl mx-auto">
            {/* College 1 */}
            <div className="bg-white/10 backdrop-blur-sm rounded-xl p-6 border-2 border-white/20">
              <div className="flex items-center gap-4 mb-4">
                {college1.logo_url && (
                  <img
                    src={college1.logo_url}
                    alt={name1}
                    className="w-16 h-16 object-contain bg-white rounded-lg p-2"
                  />
                )}
                <div>
                  <h2 className="text-2xl font-bold">{name1}</h2>
                  <p className="text-blue-100">{college1.city}, {college1.state}</p>
                </div>
              </div>
              {college1Wins > 0 && (
                <div className="flex items-center gap-2 text-yellow-300">
                  <Trophy className="w-5 h-5" />
                  <span className="font-semibold">{college1Wins} Categories Won</span>
                </div>
              )}
            </div>

            {/* College 2 */}
            <div className="bg-white/10 backdrop-blur-sm rounded-xl p-6 border-2 border-white/20">
              <div className="flex items-center gap-4 mb-4">
                {college2.logo_url && (
                  <img
                    src={college2.logo_url}
                    alt={name2}
                    className="w-16 h-16 object-contain bg-white rounded-lg p-2"
                  />
                )}
                <div>
                  <h2 className="text-2xl font-bold">{name2}</h2>
                  <p className="text-blue-100">{college2.city}, {college2.state}</p>
                </div>
              </div>
              {college2Wins > 0 && (
                <div className="flex items-center gap-2 text-yellow-300">
                  <Trophy className="w-5 h-5" />
                  <span className="font-semibold">{college2Wins} Categories Won</span>
                </div>
              )}
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

        {/* Comparison Table */}
        <section className="mb-12">
          <h2 className="text-3xl font-bold mb-6 text-center">
            Detailed Comparison
          </h2>
          <div className="bg-white rounded-xl shadow-lg overflow-hidden border border-gray-200">
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gradient-to-r from-blue-50 to-purple-50">
                  <tr>
                    <th className="px-6 py-4 text-left font-bold text-gray-700">
                      Category
                    </th>
                    <th className="px-6 py-4 text-center font-bold text-blue-600">
                      {name1}
                    </th>
                    <th className="px-6 py-4 text-center font-bold text-purple-600">
                      {name2}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  {comparisonData.map((row, index) => (
                    <tr
                      key={index}
                      className={`border-t border-gray-200 ${
                        index % 2 === 0 ? "bg-gray-50" : "bg-white"
                      }`}
                    >
                      <td className="px-6 py-4 font-semibold text-gray-700">
                        {row.category}
                      </td>
                      <td
                        className={`px-6 py-4 text-center ${
                          row.winner === 1
                            ? "bg-green-50 font-bold text-green-700"
                            : ""
                        }`}
                      >
                        <div className="flex items-center justify-center gap-2">
                          {row.winner === 1 && (
                            <CheckCircle2 className="w-5 h-5 text-green-600" />
                          )}
                          {row.college1Value}
                        </div>
                      </td>
                      <td
                        className={`px-6 py-4 text-center ${
                          row.winner === 2
                            ? "bg-green-50 font-bold text-green-700"
                            : ""
                        }`}
                      >
                        <div className="flex items-center justify-center gap-2">
                          {row.winner === 2 && (
                            <CheckCircle2 className="w-5 h-5 text-green-600" />
                          )}
                          {row.college2Value}
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </section>

        {/* Conclusion */}
        <section className="mb-12">
          <h2 className="text-3xl font-bold mb-6">Final Verdict</h2>
          <div className="bg-gradient-to-r from-blue-50 to-purple-50 rounded-xl p-8">
            <p className="text-gray-700 leading-relaxed mb-6">{content.conclusion}</p>

            <div className="grid md:grid-cols-2 gap-4">
              <Link
                href={`/colleges/${college1.slug}`}
                className="block bg-white rounded-lg p-6 shadow-sm hover:shadow-md transition-shadow border-2 border-blue-200 hover:border-blue-400"
              >
                <h3 className="font-bold text-lg mb-2">Explore {name1}</h3>
                <p className="text-gray-600 text-sm">
                  View detailed information, placements, and cutoffs →
                </p>
              </Link>

              <Link
                href={`/colleges/${college2.slug}`}
                className="block bg-white rounded-lg p-6 shadow-sm hover:shadow-md transition-shadow border-2 border-purple-200 hover:border-purple-400"
              >
                <h3 className="font-bold text-lg mb-2">Explore {name2}</h3>
                <p className="text-gray-600 text-sm">
                  View detailed information, placements, and cutoffs →
                </p>
              </Link>
            </div>
          </div>
        </section>

        {/* Related Comparisons */}
        <section className="bg-gray-50 rounded-xl p-8">
          <h2 className="text-2xl font-bold mb-6">Related Comparisons</h2>
          <div className="grid md:grid-cols-3 gap-4">
            {content.relatedComparisons.map((comparison, index) => (
              <Link
                key={index}
                href="#"
                className="text-blue-600 hover:text-blue-700 hover:underline"
              >
                {comparison} →
              </Link>
            ))}
          </div>
        </section>
      </div>
    </div>
  );
}
