import { Metadata } from "next";
import Link from "next/link";
import { createSupabaseServerClient } from "@/lib/supabase/server";

export const metadata: Metadata = {
  title: "Cutoffs | Engineering Colleges",
  description: "JEE Main/Advanced and other cutoffs across colleges and branches.",
};

export default async function CutoffsPage() {
  const supabase = createSupabaseServerClient();
  const { data: cutoffs } = await supabase
    .from("cutoffs")
    .select(
      "id, year, exam_type, category, opening_rank, closing_rank, colleges(name, slug), branches(name)"
    )
    .order("year", { ascending: false })
    .limit(200);

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-6">Cutoffs</h1>

        {cutoffs && cutoffs.length > 0 ? (
          <div className="grid grid-cols-1 gap-4">
            {cutoffs.map((cutoff: any) => (
              <div key={cutoff.id} className="bg-white rounded-lg shadow-md p-5">
                <div className="flex items-center justify-between">
                  <div className="text-sm text-gray-600">
                    {cutoff.exam_type} {cutoff.category ? `• ${cutoff.category}` : ""}
                  </div>
                  {cutoff.year && (
                    <span className="text-sm text-gray-500">{cutoff.year}</span>
                  )}
                </div>
                <div className="mt-1 text-sm text-gray-700">
                  Opening: {cutoff.opening_rank ?? "N/A"} • Closing:{" "}
                  {cutoff.closing_rank ?? "N/A"}
                </div>
                <div className="text-sm text-gray-700">
                  Branch: {cutoff.branches?.name || "N/A"}
                </div>
                {cutoff.colleges?.name && (
                  <Link
                    href={`/colleges/${cutoff.colleges.slug}`}
                    className="text-sm text-primary-600 hover:underline mt-2 inline-block"
                  >
                    {cutoff.colleges.name}
                  </Link>
                )}
              </div>
            ))}
          </div>
        ) : (
          <div className="bg-white rounded-lg shadow-md p-6 text-gray-600">
            No cutoffs found yet.
          </div>
        )}
      </div>
    </div>
  );
}
