"use client";

import { useEffect, useState } from "react";
import { createSupabaseClient } from "@/lib/supabase/client";
import { FileText, ExternalLink } from "lucide-react";

interface CutoffsSectionProps {
  collegeId: string;
  branches: any[];
}

export function CutoffsSection({ collegeId, branches }: CutoffsSectionProps) {
  const [cutoffs, setCutoffs] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchCutoffs() {
      const supabase = createSupabaseClient();
      const { data } = await supabase
        .from("cutoffs")
        .select("*, branches(*)")
        .eq("college_id", collegeId)
        .order("year", { ascending: false })
        .limit(10);

      if (data) setCutoffs(data);
      setLoading(false);
    }
    fetchCutoffs();
  }, [collegeId]);

  if (loading) {
    return (
      <section className="bg-white rounded-lg shadow-md p-6 text-slate-900">
        <h2 className="text-2xl font-bold text-slate-900 mb-6">Cutoffs</h2>
        <div className="text-center py-8 text-slate-600">Loading...</div>
      </section>
    );
  }

  if (cutoffs.length === 0) {
    return (
      <section className="bg-white rounded-lg shadow-md p-6 text-slate-900">
        <h2 className="text-2xl font-bold text-slate-900 mb-6 flex items-center">
          <FileText className="h-6 w-6 mr-2 text-primary-600" />
          Cutoffs
        </h2>
        <div className="text-center py-8 text-slate-600">
          Cutoff data not available
        </div>
      </section>
    );
  }

  return (
    <section className="bg-white rounded-lg shadow-md p-6 text-slate-900">
      <h2 className="text-2xl font-bold text-slate-900 mb-6 flex items-center">
        <FileText className="h-6 w-6 mr-2 text-primary-600" />
        Cutoffs
      </h2>
      <div className="overflow-x-auto">
        <table className="w-full">
          <thead>
            <tr className="border-b border-slate-200">
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Year</th>
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Branch</th>
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Exam</th>
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Category</th>
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Opening</th>
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Closing</th>
              <th className="text-left py-2 px-4 font-semibold text-slate-700">Proof</th>
            </tr>
          </thead>
          <tbody>
            {cutoffs.map((cutoff) => (
              <tr key={cutoff.id} className="border-b border-slate-100 text-slate-900">
                <td className="py-2 px-4">{cutoff.year}</td>
                <td className="py-2 px-4">
                  {cutoff.branches?.name || "N/A"}
                </td>
                <td className="py-2 px-4">{cutoff.exam_type}</td>
                <td className="py-2 px-4">{cutoff.category}</td>
                <td className="py-2 px-4">
                  {cutoff.opening_rank || cutoff.opening_percentile
                    ? cutoff.opening_rank
                      ? `Rank ${cutoff.opening_rank}`
                      : `Percentile ${cutoff.opening_percentile}`
                    : "N/A"}
                </td>
                <td className="py-2 px-4 font-semibold text-slate-900">
                  {cutoff.closing_rank || cutoff.closing_percentile
                    ? cutoff.closing_rank
                      ? `Rank ${cutoff.closing_rank}`
                      : `Percentile ${cutoff.closing_percentile}`
                    : "N/A"}
                </td>
                <td className="py-2 px-4">
                  {cutoff.proof_link && (
                    <a
                      href={cutoff.proof_link}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-primary-600 hover:underline flex items-center"
                    >
                      View
                      <ExternalLink className="h-4 w-4 ml-1" />
                    </a>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </section>
  );
}
