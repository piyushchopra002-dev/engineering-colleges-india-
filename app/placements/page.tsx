import { Metadata } from "next";
import Link from "next/link";
import { createSupabaseServerClient } from "@/lib/supabase/server";

export const metadata: Metadata = {
  title: "Placements | Engineering Colleges",
  description: "Placement highlights and statistics across engineering colleges.",
};

export default async function PlacementsPage() {
  const supabase = createSupabaseServerClient();
  const { data: placements } = await supabase
    .from("placements")
    .select("id, year, offer_type, salary_offered, currency, companies(name), colleges(name, slug)")
    .order("year", { ascending: false })
    .limit(200);

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-6">Placements</h1>

        {placements && placements.length > 0 ? (
          <div className="grid grid-cols-1 gap-4">
            {placements.map((placement: any) => (
              <div key={placement.id} className="bg-white rounded-lg shadow-md p-5">
                <div className="flex items-center justify-between">
                  <div className="text-sm text-gray-600">
                    {placement.companies?.name || "Company"}{" "}
                    {placement.offer_type ? `• ${placement.offer_type}` : ""}
                  </div>
                  {placement.year && (
                    <span className="text-sm text-gray-500">{placement.year}</span>
                  )}
                </div>
                {placement.salary_offered && (
                  <div className="mt-1 text-sm text-gray-700">
                    Salary: {placement.currency || "INR"} {placement.salary_offered}
                  </div>
                )}
                {placement.colleges?.name && (
                  <Link
                    href={`/colleges/${placement.colleges.slug}`}
                    className="text-sm text-primary-600 hover:underline mt-2 inline-block"
                  >
                    {placement.colleges.name}
                  </Link>
                )}
              </div>
            ))}
          </div>
        ) : (
          <div className="bg-white rounded-lg shadow-md p-6 text-gray-600">
            No placement records found yet.
          </div>
        )}
      </div>
    </div>
  );
}
