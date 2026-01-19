import Link from "next/link";
import { createSupabaseServerClient } from "@/lib/supabase/server";

export default async function AdminAchievementsPage() {
  const supabase = createSupabaseServerClient();
  const { data: achievements } = await supabase
    .from("achievements")
    .select("id, title, year, category, is_extraordinary, colleges(name, slug)")
    .order("year", { ascending: false })
    .limit(200);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Achievements</h1>
        <Link href="/achievements" className="text-primary-600 hover:underline text-sm">
          View public page
        </Link>
      </div>

      {achievements && achievements.length > 0 ? (
        <div className="bg-white rounded-lg shadow-md p-4">
          <div className="space-y-3">
            {achievements.map((achievement: any) => (
              <div
                key={achievement.id}
                className="border-b border-gray-100 pb-3 last:border-0"
              >
                <div className="font-medium text-gray-900">{achievement.title}</div>
                <div className="text-sm text-gray-600">
                  {achievement.category} {achievement.year ? `• ${achievement.year}` : ""}
                  {achievement.is_extraordinary ? " • Extraordinary" : ""}
                </div>
                {achievement.colleges?.name && (
                  <Link
                    href={`/colleges/${achievement.colleges.slug}`}
                    className="text-sm text-primary-600 hover:underline"
                  >
                    {achievement.colleges.name}
                  </Link>
                )}
              </div>
            ))}
          </div>
        </div>
      ) : (
        <div className="bg-white rounded-lg shadow-md p-6 text-gray-600">
          No achievements found yet.
        </div>
      )}
    </div>
  );
}
