import { Ranking } from "@/types";
import { Award, ExternalLink } from "lucide-react";

interface RankingsSectionProps {
  rankings: Ranking[];
}

export function RankingsSection({ rankings }: RankingsSectionProps) {
  const groupedRankings = rankings.reduce((acc, ranking) => {
    if (!acc[ranking.ranking_type]) {
      acc[ranking.ranking_type] = [];
    }
    acc[ranking.ranking_type].push(ranking);
    return acc;
  }, {} as Record<string, Ranking[]>);

  return (
    <section className="bg-white rounded-lg shadow-md p-6 text-slate-900">
      <h2 className="text-2xl font-bold text-slate-900 mb-6 flex items-center">
        <Award className="h-6 w-6 mr-2 text-primary-600" />
        Rankings
      </h2>
      {Object.keys(groupedRankings).length === 0 ? (
        <div className="text-center py-8 text-slate-600">
          No ranking data available yet
        </div>
      ) : (
        <div className="space-y-6">
        {Object.entries(groupedRankings).map(([type, typeRankings]) => (
          <div key={type}>
            <h3 className="text-lg font-semibold text-slate-800 mb-3">{type}</h3>
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead>
                  <tr className="border-b border-slate-200">
                    <th className="text-left py-2 px-4 font-semibold text-slate-700">Year</th>
                    <th className="text-left py-2 px-4 font-semibold text-slate-700">Rank</th>
                    <th className="text-left py-2 px-4 font-semibold text-slate-700">Category</th>
                    <th className="text-left py-2 px-4 font-semibold text-slate-700">Proof</th>
                  </tr>
                </thead>
                <tbody>
                  {typeRankings.map((ranking) => (
                    <tr key={ranking.id} className="border-b border-slate-100 text-slate-900">
                      <td className="py-2 px-4">{ranking.year}</td>
                      <td className="py-2 px-4 font-semibold text-slate-900">
                        {ranking.rank ? `#${ranking.rank}` : "N/A"}
                      </td>
                      <td className="py-2 px-4 text-slate-700">
                        {ranking.category || "Overall"}
                      </td>
                      <td className="py-2 px-4">
                        {ranking.proof_link && (
                          <a
                            href={ranking.proof_link}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="text-primary-600 hover:underline flex items-center"
                          >
                            View Proof
                            <ExternalLink className="h-4 w-4 ml-1" />
                          </a>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        ))}
      </div>
      )}
    </section>
  );
}
