"use client";

import { useEffect, useState } from "react";
import { createSupabaseClient } from "@/lib/supabase/client";
import { Briefcase, TrendingUp } from "lucide-react";
import { formatCurrency } from "@/lib/utils";

interface PlacementsSectionProps {
  collegeId: string;
  branches: any[];
}

export function PlacementsSection({ collegeId, branches }: PlacementsSectionProps) {
  const [placementStats, setPlacementStats] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchPlacements() {
      const supabase = createSupabaseClient();
      const { data } = await supabase
        .from("placement_stats")
        .select("*, branches(*)")
        .eq("college_id", collegeId)
        .order("year", { ascending: false })
        .limit(5);

      if (data) setPlacementStats(data);
      setLoading(false);
    }
    fetchPlacements();
  }, [collegeId]);

  if (loading) {
    return (
      <section className="bg-white rounded-lg shadow-md p-6 text-slate-900">
        <h2 className="text-2xl font-bold text-slate-900 mb-6">Placements</h2>
        <div className="text-center py-8 text-slate-600">Loading...</div>
      </section>
    );
  }

  if (placementStats.length === 0) {
    return (
      <section className="bg-white rounded-lg shadow-md p-6 text-slate-900">
        <h2 className="text-2xl font-bold text-slate-900 mb-6 flex items-center">
          <Briefcase className="h-6 w-6 mr-2 text-primary-600" />
          Placements
        </h2>
        <div className="text-center py-8 text-slate-600">
          Placement data not available
        </div>
      </section>
    );
  }

  return (
    <section className="bg-white rounded-lg shadow-md p-6 text-slate-900">
      <h2 className="text-2xl font-bold text-slate-900 mb-6 flex items-center">
        <Briefcase className="h-6 w-6 mr-2 text-primary-600" />
        Placements
      </h2>
      <div className="overflow-x-auto">
        <table className="w-full">
          <thead>
            <tr className="border-b border-slate-200">
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Year</th>
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Branch</th>
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Placed</th>
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Avg Salary</th>
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Highest</th>
            </tr>
          </thead>
          <tbody>
            {placementStats.map((stat) => (
              <tr key={stat.id} className="border-b border-slate-100 text-slate-900">
                <td className="py-2 px-4">{stat.year}</td>
                <td className="py-2 px-4">
                  {stat.branches?.name || "Overall"}
                </td>
                <td className="py-2 px-4">
                  {stat.placed_students && stat.total_students
                    ? `${stat.placed_students}/${stat.total_students} (${stat.placement_percentage?.toFixed(1)}%)`
                    : "N/A"}
                </td>
                <td className="py-2 px-4 font-semibold text-slate-900">
                  {stat.average_salary
                    ? formatCurrency(stat.average_salary)
                    : "N/A"}
                </td>
                <td className="py-2 px-4 font-semibold text-primary-600">
                  {stat.highest_salary
                    ? formatCurrency(stat.highest_salary)
                    : "N/A"}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </section>
  );
}
