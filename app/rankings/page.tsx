import { Metadata } from "next";
import Link from "next/link";
import { createSupabaseServerClient } from "@/lib/supabase/server";

export const metadata: Metadata = {
  title: "College Rankings | Engineering Colleges",
  description: "NIRF, QS, THE, and other rankings for engineering colleges.",
};

export default async function RankingsPage() {
  const supabase = createSupabaseServerClient();
  const { data: rankings } = await supabase
    .from("college_rankings")
    .select("id, ranking_type, year, rank, category, colleges(name, slug)")
    .order("year", { ascending: false })
    .order("rank", { ascending: true })
    .limit(200);

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-6">College Rankings</h1>

        {rankings && rankings.length > 0 ? (
          <div className="grid grid-cols-1 gap-4">
            {rankings.map((ranking: any) => (
              <div key={ranking.id} className="bg-white rounded-lg shadow-md p-5">
                <div className="flex items-center justify-between">
                  <div className="text-sm text-gray-600">
                    {ranking.ranking_type} {ranking.category ? `• ${ranking.category}` : ""}
                  </div>
                  {ranking.year && (
                    <span className="text-sm text-gray-500">{ranking.year}</span>
                  )}
                </div>
                <div className="mt-1 text-xl font-semibold text-gray-900">
                  Rank {ranking.rank ?? "N/A"}
                </div>
                {ranking.colleges?.name && (
                  <Link
                    href={`/colleges/${ranking.colleges.slug}`}
                    className="text-sm text-primary-600 hover:underline mt-2 inline-block"
                  >
                    {ranking.colleges.name}
                  </Link>
                )}
              </div>
            ))}
          </div>
        ) : (
          <div className="bg-white rounded-lg shadow-md p-6 text-gray-600">
            No rankings found yet.
          </div>
        )}
      </div>
    </div>
  );
}
