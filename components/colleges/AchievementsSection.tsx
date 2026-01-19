import { Achievement } from "@/types";
import { Award, ExternalLink } from "lucide-react";
import { cn } from "@/lib/utils";

interface AchievementsSectionProps {
  achievements: Achievement[];
}

export function AchievementsSection({ achievements }: AchievementsSectionProps) {
  const groupedByCategory = achievements.reduce((acc, achievement) => {
    if (!acc[achievement.category]) {
      acc[achievement.category] = [];
    }
    acc[achievement.category].push(achievement);
    return acc;
  }, {} as Record<string, Achievement[]>);

  const categoryLabels: Record<string, string> = {
    academics: "Academics",
    placements: "Placements",
    research: "Research & Innovation",
    student: "Student Achievements",
    sports: "Sports & Cultural",
    social_impact: "Social Impact",
  };

  return (
    <section className="bg-white rounded-lg shadow-md p-6">
      <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center">
        <Award className="h-6 w-6 mr-2 text-primary-600" />
        Achievements
      </h2>
      {Object.keys(groupedByCategory).length === 0 ? (
        <div className="text-center py-8 text-slate-600">
          No achievements data available yet
        </div>
      ) : (
        <div className="space-y-6">
        {Object.entries(groupedByCategory).map(([category, categoryAchievements]) => (
          <div key={category}>
            <h3 className="text-lg font-semibold text-gray-800 mb-4 capitalize">
              {categoryLabels[category] || category}
            </h3>
            <div className="space-y-4">
              {categoryAchievements
                .sort((a, b) => b.year - a.year)
                .map((achievement) => (
                  <div
                    key={achievement.id}
                    className={cn(
                      "border-l-4 pl-4 py-2",
                      achievement.is_extraordinary
                        ? "border-primary-600 bg-primary-50"
                        : "border-gray-300"
                    )}
                  >
                    <div className="flex items-start justify-between">
                      <div className="flex-1">
                        <h4
                          className={cn(
                            "font-semibold mb-1",
                            achievement.is_extraordinary
                              ? "text-primary-900"
                              : "text-gray-900"
                          )}
                        >
                          {achievement.title}
                        </h4>
                        {achievement.description && (
                          <p className="text-gray-600 text-sm mb-2">
                            {achievement.description}
                          </p>
                        )}
                        <div className="flex items-center gap-4 text-xs text-gray-500">
                          <span>Year: {achievement.year}</span>
                          {achievement.is_extraordinary && (
                            <span className="px-2 py-1 bg-primary-200 text-primary-800 rounded font-medium">
                              Extraordinary
                            </span>
                          )}
                        </div>
                      </div>
                      {achievement.proof_link && (
                        <a
                          href={achievement.proof_link}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="ml-4 text-primary-600 hover:underline flex items-center"
                        >
                          <ExternalLink className="h-4 w-4" />
                        </a>
                      )}
                    </div>
                  </div>
                ))}
            </div>
          </div>
        ))}
      </div>
      )}
    </section>
  );
}
