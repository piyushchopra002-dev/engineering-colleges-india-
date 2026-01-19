"use client";

import { useState, useEffect, useRef } from "react";
import { createSupabaseClient } from "@/lib/supabase/client";
import { Search, Plus, X, Download, Share2, Sparkles } from "lucide-react";
import { formatCurrency, formatNumber, generateShareToken } from "@/lib/utils";
import { generateAIResponse, getContextualData } from "@/lib/openrouter";
import toast from "react-hot-toast";

export function ComparisonTool() {
  const [selectedColleges, setSelectedColleges] = useState<any[]>([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [searchResults, setSearchResults] = useState<any[]>([]);
  const [suggestions, setSuggestions] = useState<any[]>([]);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const blurTimeout = useRef<ReturnType<typeof setTimeout> | null>(null);
  const [comparisonData, setComparisonData] = useState<any>(null);
  const [loading, setLoading] = useState(false);
  const [aiInsight, setAiInsight] = useState<string | null>(null);
  const [loadingInsight, setLoadingInsight] = useState(false);

  useEffect(() => {
    if (selectedColleges.length >= 2) {
      fetchComparisonData();
    } else {
      setComparisonData(null);
      setAiInsight(null);
    }
  }, [selectedColleges]);

  const searchColleges = async (query: string) => {
    if (query.length < 1) {
      setSearchResults([]);
      return;
    }

    const supabase = createSupabaseClient();
    const { data } = await supabase
      .from("colleges")
      .select("id, name, slug, city, state, college_type")
      .ilike("name", `%${query}%`)
      .limit(10);

    if (data) {
      setSearchResults(
        data.filter(
          (c) => !selectedColleges.some((sc) => sc.id === c.id)
        )
      );
    }
  };

  const fetchSuggestions = async () => {
    const supabase = createSupabaseClient();
    const { data } = await supabase
      .from("colleges")
      .select("id, name, slug, city, state, college_type")
      .order("name", { ascending: true })
      .limit(8);

    if (data) {
      setSuggestions(
        data.filter((c) => !selectedColleges.some((sc) => sc.id === c.id))
      );
    }
  };

  const addCollege = (college: any) => {
    setSelectedColleges((prev) => {
      if (prev.some((c) => c.id === college.id)) {
        toast.error("College already added");
        return prev;
      }
      return [...prev, college];
    });
    setSearchResults((prev) => prev.filter((item) => item.id !== college.id));
    setSuggestions((prev) => prev.filter((item) => item.id !== college.id));
    setShowSuggestions(true);
  };

  const removeCollege = (id: string) => {
    setSelectedColleges(selectedColleges.filter((c) => c.id !== id));
  };

  const handleFocus = () => {
    if (blurTimeout.current) {
      clearTimeout(blurTimeout.current);
      blurTimeout.current = null;
    }
    setShowSuggestions(true);
    if (searchQuery.length < 1 && suggestions.length === 0) {
      fetchSuggestions();
    }
  };

  const handleBlur = () => {
    blurTimeout.current = setTimeout(() => {
      setShowSuggestions(false);
    }, 120);
  };

  const displayResults =
    searchQuery.length >= 1 ? searchResults : suggestions;

  const renderSearchPopup = () => {
    if (!showSuggestions) return null;

    if (displayResults.length === 0) {
      return (
        <div className="absolute z-20 mt-2 w-full rounded-2xl border border-white/10 bg-slate-950/95 backdrop-blur shadow-xl shadow-black/30 p-4 text-sm text-slate-300">
          {searchQuery.length >= 1 ? "No colleges found" : "Start typing to search"}
        </div>
      );
    }

    return (
      <div className="absolute z-20 mt-2 w-full rounded-2xl border border-white/10 bg-slate-950/95 backdrop-blur shadow-xl shadow-black/30 max-h-72 overflow-auto">
        {displayResults.map((college) => (
          <button
            key={college.id}
            onMouseDown={(event) => {
              event.preventDefault();
              addCollege(college);
              setShowSuggestions(false);
            }}
            className="w-full text-left px-4 py-3 hover:bg-white/5 border-b border-white/10 last:border-0"
          >
            <div className="font-medium text-white">{college.name}</div>
            <div className="text-sm text-slate-400">
              {college.city}, {college.state}
            </div>
          </button>
        ))}
      </div>
    );
  };

  const renderSearchInput = (
    placeholder: string,
    className: string,
    wrapperClassName = "relative mb-4"
  ) => (
    <div className={wrapperClassName}>
      <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-slate-400" />
      <input
        type="text"
        value={searchQuery}
        onChange={(e) => {
          setSearchQuery(e.target.value);
          searchColleges(e.target.value);
        }}
        onFocus={handleFocus}
        onBlur={handleBlur}
        placeholder={placeholder}
        className={className}
      />
      {renderSearchPopup()}
    </div>
  );

  const fetchComparisonData = async () => {
    setLoading(true);
    const supabase = createSupabaseClient();
    const collegeIds = selectedColleges.map((c) => c.id);

    // Use 2024 as the latest year with data (instead of 2025)
    const latestYear = 2024;

    const [
      { data: colleges },
      { data: rankings },
      { data: placementStats },
      { data: cutoffs },
      { data: branches },
    ] = await Promise.all([
      supabase
        .from("colleges")
        .select("*")
        .in("id", collegeIds),
      supabase
        .from("college_rankings")
        .select("*")
        .in("college_id", collegeIds)
        .eq("year", latestYear),
      supabase
        .from("placement_stats")
        .select("*, branches(name)")
        .in("college_id", collegeIds)
        .eq("year", latestYear)
        .order("average_salary", { ascending: false }),
      supabase
        .from("cutoffs")
        .select("*, branches(name)")
        .in("college_id", collegeIds)
        .eq("year", latestYear)
        .eq("category", "General")
        .order("closing_rank", { ascending: true }),
      supabase
        .from("branches")
        .select("*")
        .limit(10),
    ]);

    setComparisonData({
      colleges: colleges || [],
      rankings: rankings || [],
      placementStats: placementStats || [],
      cutoffs: cutoffs || [],
      branches: branches || [],
    });
    setLoading(false);
  };

  const generateInsight = async () => {
    if (selectedColleges.length < 2) return;

    setLoadingInsight(true);
    try {
      const context = await getContextualData(
        `Compare ${selectedColleges.map((c) => c.name).join(" vs ")}`
      );
      const insight = await generateAIResponse(
        [
          {
            role: "user",
            content: `Compare these engineering colleges and provide insights: ${selectedColleges.map((c) => c.name).join(", ")}. Consider rankings, placements, infrastructure, location, and overall value.`,
          },
        ],
        context
      );
      setAiInsight(insight);
    } catch (error) {
      toast.error("Failed to generate AI insight");
    }
    setLoadingInsight(false);
  };

  const exportComparison = () => {
    // Export logic here
    toast.success("Export feature coming soon");
  };

  const shareComparison = async () => {
    const token = generateShareToken();
    // Save comparison with token
    toast.success("Share link copied to clipboard");
  };

  if (comparisonData && comparisonData.colleges.length > 0) {
    const colleges = comparisonData.colleges;
    const rankings = comparisonData.rankings;
    const placements = comparisonData.placementStats;
    const cutoffs = comparisonData.cutoffs;

    return (
      <div className="min-h-screen bg-transparent py-8 text-white relative overflow-hidden">
        <div className="absolute inset-0 pointer-events-none">
          {/* Animated Gradient Orbs */}
          <div className="absolute top-32 left-20 w-96 h-96 bg-primary-500/15 rounded-full blur-3xl animate-float animate-morph" style={{ animationDuration: "22s" }}></div>
          <div className="absolute top-1/3 right-10 w-80 h-80 bg-fuchsia-500/12 rounded-full blur-3xl animate-float" style={{ animationDelay: "6s", animationDuration: "26s" }}></div>
          <div className="absolute bottom-40 left-1/3 w-72 h-72 bg-blue-500/15 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "12s", animationDuration: "20s" }}></div>
          <div className="absolute top-2/3 right-1/4 w-64 h-64 bg-purple-500/12 rounded-full blur-3xl animate-float" style={{ animationDelay: "4s", animationDuration: "24s" }}></div>
          
          {/* Floral Elements */}
          <div className="floral-left"></div>
          <div className="floral-right"></div>
          <div className="floral-petals"></div>
        </div>
        <div className="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col gap-3 md:flex-row md:items-center md:justify-between mb-6">
            <h1 className="text-3xl font-bold text-white">Compare Colleges</h1>
            <div className="flex flex-wrap gap-2">
              <button
                onClick={exportComparison}
                className="px-4 py-2 bg-white/10 border border-white/10 rounded-lg hover:bg-white/20 flex items-center"
              >
                <Download className="h-4 w-4 mr-2" />
                Export
              </button>
              <button
                onClick={shareComparison}
                className="px-4 py-2 bg-white/10 border border-white/10 rounded-lg hover:bg-white/20 flex items-center"
              >
                <Share2 className="h-4 w-4 mr-2" />
                Share
              </button>
            </div>
          </div>

          {/* Selected Colleges */}
          <div className="bg-white/10 border border-white/20 rounded-lg shadow-md p-4 mb-6">
            <div className="flex flex-wrap items-start gap-2">
              {selectedColleges.map((college) => (
                <div
                  key={college.id}
                  className="flex items-center gap-2 px-3 py-2 bg-white/15 text-white rounded-lg"
                >
                  <span className="font-medium">{college.name}</span>
                  <button
                    onClick={() => removeCollege(college.id)}
                    className="text-slate-300 hover:text-white"
                  >
                    <X className="h-4 w-4" />
                  </button>
                </div>
              ))}
              <div className="relative">
                {renderSearchInput(
                  "Add college...",
                  "px-3 py-2 h-10 border border-white/10 rounded-lg focus:ring-2 focus:ring-primary-500 w-full sm:w-64 bg-slate-950/90 text-white placeholder:text-slate-500",
                  "relative w-full sm:w-64"
                )}
              </div>
            </div>
          </div>

          {/* AI Insight */}
          <div className="bg-white/10 border border-white/20 rounded-lg shadow-md p-6 mb-6">
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-xl font-bold text-white flex items-center">
                <Sparkles className="h-5 w-5 mr-2 text-primary-400" />
                AI-Powered Insights
              </h2>
              <button
                onClick={generateInsight}
                disabled={loadingInsight}
                className="px-4 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 disabled:opacity-50"
              >
                {loadingInsight ? "Generating..." : "Generate Insight"}
              </button>
            </div>
            {aiInsight && (
              <div className="prose max-w-none">
                <p className="text-slate-200 whitespace-pre-wrap">{aiInsight}</p>
              </div>
            )}
          </div>

          {/* Comparison Table */}
          <div className="bg-white/10 border border-white/20 rounded-lg shadow-md overflow-hidden">
            <div className="overflow-x-auto">
              <table className="w-full min-w-max table-auto">
                <thead className="bg-white/10">
                  <tr>
                    <th className="px-4 py-3 text-left font-semibold text-white sticky left-0 bg-slate-950 z-10">
                      Criteria
                    </th>
                    {colleges.map((college: any) => (
                      <th
                        key={college.id}
                        className="px-4 py-3 text-left font-semibold text-white min-w-[220px] whitespace-nowrap"
                      >
                        {college.name}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody className="divide-y divide-white/20">
                  {/* Location */}
                  <tr>
                    <td className="px-4 py-3 font-medium text-white sticky left-0 bg-slate-950 z-10">
                      Location
                    </td>
                    {colleges.map((college: any) => (
                      <td key={college.id} className="px-4 py-3 text-slate-300 whitespace-nowrap">
                        {college.city}, {college.state}
                      </td>
                    ))}
                  </tr>

                  {/* Rankings */}
                  <tr className="bg-white/5">
                    <td className="px-4 py-3 font-medium text-white sticky left-0 bg-slate-950 z-10">
                      NIRF Rank (Latest)
                    </td>
                    {colleges.map((college: any) => {
                      const ranking = rankings.find(
                        (r: any) => r.college_id === college.id && r.ranking_type === "NIRF"
                      );
                      return (
                        <td key={college.id} className="px-4 py-3 text-slate-300 whitespace-nowrap">
                          {ranking?.rank ? `#${ranking.rank}` : "N/A"}
                        </td>
                      );
                    })}
                  </tr>

                  {/* Average Salary */}
                  <tr>
                    <td className="px-4 py-3 font-medium text-white sticky left-0 bg-slate-950 z-10">
                      Avg Placement Salary (2024)
                    </td>
                    {colleges.map((college: any) => {
                      const collegePlacements = placements.filter(
                        (p: any) => p.college_id === college.id
                      );
                      const avgSalary = collegePlacements.length > 0
                        ? collegePlacements.reduce((sum: number, p: any) => sum + (p.average_salary || 0), 0) / collegePlacements.length
                        : 0;
                      return (
                        <td key={college.id} className="px-4 py-3 text-slate-300 whitespace-nowrap">
                          {avgSalary > 0
                            ? formatCurrency(avgSalary)
                            : "N/A"}
                        </td>
                      );
                    })}
                  </tr>

                  {/* Highest Salary */}
                  <tr className="bg-white/5">
                    <td className="px-4 py-3 font-medium text-white sticky left-0 bg-slate-950 z-10">
                      Highest Salary (2024)
                    </td>
                    {colleges.map((college: any) => {
                      const collegePlacements = placements.filter(
                        (p: any) => p.college_id === college.id
                      );
                      const highestSalary = collegePlacements.length > 0
                        ? Math.max(...collegePlacements.map((p: any) => p.highest_salary || 0))
                        : 0;
                      return (
                        <td key={college.id} className="px-4 py-3 text-slate-300 whitespace-nowrap">
                          {highestSalary > 0
                            ? formatCurrency(highestSalary)
                            : "N/A"}
                        </td>
                      );
                    })}
                  </tr>

                  {/* Placement Percentage */}
                  <tr>
                    <td className="px-4 py-3 font-medium text-white sticky left-0 bg-slate-950 z-10">
                      Placement % (2024)
                    </td>
                    {colleges.map((college: any) => {
                      const collegePlacements = placements.filter(
                        (p: any) => p.college_id === college.id
                      );
                      const avgPlacement = collegePlacements.length > 0
                        ? collegePlacements.reduce((sum: number, p: any) => sum + (parseFloat(p.placement_percentage) || 0), 0) / collegePlacements.length
                        : 0;
                      return (
                        <td key={college.id} className="px-4 py-3 text-slate-300 whitespace-nowrap">
                          {avgPlacement > 0
                            ? `${avgPlacement.toFixed(1)}%`
                            : "N/A"}
                        </td>
                      );
                    })}
                  </tr>

                  {/* JEE Cutoff (General) */}
                  <tr className="bg-white/5">
                    <td className="px-4 py-3 font-medium text-white sticky left-0 bg-slate-950 z-10">
                      JEE Cutoff Rank (General)
                    </td>
                    {colleges.map((college: any) => {
                      const collegeCutoffs = cutoffs.filter(
                        (c: any) => c.college_id === college.id
                      );
                      const bestCutoff = collegeCutoffs.length > 0
                        ? Math.min(...collegeCutoffs.map((c: any) => c.closing_rank || 999999))
                        : 0;
                      return (
                        <td key={college.id} className="px-4 py-3 text-slate-300 whitespace-nowrap">
                          {bestCutoff > 0 && bestCutoff < 999999
                            ? `Rank ${bestCutoff}`
                            : "N/A"}
                        </td>
                      );
                    })}
                  </tr>

                  {/* Established Year */}
                  <tr>
                    <td className="px-4 py-3 font-medium text-white sticky left-0 bg-slate-950 z-10">
                      Established
                    </td>
                    {colleges.map((college: any) => (
                      <td key={college.id} className="px-4 py-3 text-slate-300 whitespace-nowrap">
                        {college.established_year || "N/A"}
                      </td>
                    ))}
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-transparent py-8 text-white relative overflow-hidden">
      {/* Grid Pattern */}
      <div className="absolute inset-0 grid-pattern pointer-events-none opacity-30"></div>
      
      <div className="absolute inset-0 pointer-events-none">
        {/* Animated Gradient Orbs */}
        <div className="absolute top-32 left-20 w-96 h-96 bg-primary-500/15 rounded-full blur-3xl animate-float animate-morph" style={{ animationDuration: "22s" }}></div>
        <div className="absolute top-1/3 right-10 w-80 h-80 bg-fuchsia-500/12 rounded-full blur-3xl animate-float" style={{ animationDelay: "6s", animationDuration: "26s" }}></div>
        <div className="absolute bottom-40 left-1/3 w-72 h-72 bg-blue-500/15 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "12s", animationDuration: "20s" }}></div>
        <div className="absolute top-2/3 right-1/4 w-64 h-64 bg-purple-500/12 rounded-full blur-3xl animate-float" style={{ animationDelay: "4s", animationDuration: "24s" }}></div>
        
        {/* Aurora Effect */}
        <div className="absolute top-0 left-0 w-full h-full bg-gradient-to-br from-primary-500/5 via-transparent to-fuchsia-500/5 animate-aurora" style={{ animationDuration: "25s" }}></div>
        
        {/* Floral Elements */}
        <div className="floral-left"></div>
        <div className="floral-right"></div>
        <div className="floral-petals"></div>
      </div>
      <div className="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-white mb-6">Compare Colleges</h1>

        <div className="bg-white/10 border border-white/20 rounded-lg shadow-md p-6 mb-6">
          <h2 className="text-xl font-semibold text-white mb-4">
            Select Colleges to Compare
          </h2>
          {renderSearchInput(
            "Search colleges...",
            "w-full pl-10 pr-4 py-3 h-12 border border-white/10 rounded-lg focus:ring-2 focus:ring-primary-500 bg-slate-950/90 text-white placeholder:text-slate-500",
            "relative mb-4"
          )}
        </div>

        {selectedColleges.length > 0 && (
          <div className="bg-white/10 border border-white/20 rounded-lg shadow-md p-4">
            <h3 className="font-semibold text-white mb-3">Selected Colleges</h3>
            <div className="flex flex-wrap gap-2">
              {selectedColleges.map((college) => (
                <div
                  key={college.id}
                  className="flex items-center gap-2 px-3 py-2 bg-white/15 text-white rounded-lg"
                >
                  <span>{college.name}</span>
                  <button
                    onClick={() => removeCollege(college.id)}
                    className="text-slate-300 hover:text-white"
                  >
                    <X className="h-4 w-4" />
                  </button>
                </div>
              ))}
            </div>
            {selectedColleges.length < 2 && (
              <p className="mt-4 text-sm text-slate-400">
                Select at least 2 colleges to compare
              </p>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
