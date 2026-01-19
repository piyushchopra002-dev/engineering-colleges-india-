import { Metadata } from "next";
import Link from "next/link";
import { createSupabaseServerClient } from "@/lib/supabase/server";

export const metadata: Metadata = {
  title: "College Achievements | Engineering Colleges",
  description: "Academic, placement, research, and sports achievements by colleges.",
};

export default async function AchievementsPage() {
  const supabase = createSupabaseServerClient();
  const { data: achievements } = await supabase
    .from("achievements")
    .select("id, title, description, year, category, is_extraordinary, colleges(name, slug)")
    .order("year", { ascending: false })
    .limit(200);

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-6">College Achievements</h1>

        {achievements && achievements.length > 0 ? (
          <div className="grid grid-cols-1 gap-4">
            {achievements.map((achievement: any) => (
              <div key={achievement.id} className="bg-white rounded-lg shadow-md p-5">
                <div className="flex items-center justify-between">
                  <h2 className="text-xl font-semibold text-gray-900">{achievement.title}</h2>
                  {achievement.year && (
                    <span className="text-sm text-gray-500">{achievement.year}</span>
                  )}
                </div>
                <div className="text-sm text-gray-600 mt-1">
                  {achievement.category?.toUpperCase()}
                  {achievement.is_extraordinary && (
                    <span className="ml-2 text-xs px-2 py-0.5 bg-yellow-100 text-yellow-800 rounded">
                      Extraordinary
                    </span>
                  )}
                </div>
                {achievement.colleges?.name && (
                  <Link
                    href={`/colleges/${achievement.colleges.slug}`}
                    className="text-sm text-primary-600 hover:underline mt-2 inline-block"
                  >
                    {achievement.colleges.name}
                  </Link>
                )}
                {achievement.description && (
                  <p className="text-gray-700 mt-2">{achievement.description}</p>
                )}
              </div>
            ))}
          </div>
        ) : (
          <div className="bg-white rounded-lg shadow-md p-6 text-gray-600">
            No achievements found yet.
          </div>
        )}
      </div>
    </div>
  );
}
