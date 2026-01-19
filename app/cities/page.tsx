import { Metadata } from "next";
import Link from "next/link";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { MapPin, Building2, TrendingUp, Sparkles } from "lucide-react";

export const metadata: Metadata = {
  title: "Cities | Engineering Colleges",
  description: "Cities covered by the engineering colleges list.",
};

// Gradient color schemes for cities
const gradientSchemes = [
  "from-pink-500 via-rose-500 to-red-500",
  "from-purple-500 via-violet-500 to-indigo-500",
  "from-blue-500 via-cyan-500 to-teal-500",
  "from-green-500 via-emerald-500 to-teal-500",
  "from-yellow-500 via-orange-500 to-red-500",
  "from-fuchsia-500 via-purple-500 to-pink-500",
  "from-indigo-500 via-blue-500 to-cyan-500",
  "from-orange-500 via-amber-500 to-yellow-500",
  "from-rose-500 via-pink-500 to-fuchsia-500",
  "from-teal-500 via-green-500 to-emerald-500",
  "from-violet-500 via-purple-500 to-fuchsia-500",
  "from-cyan-500 via-blue-500 to-indigo-500",
];

export default async function CitiesPage() {
  const supabase = createSupabaseServerClient();
  const { data: colleges } = await supabase
    .from("colleges")
    .select("city, state")
    .order("city", { ascending: true });

  // Get unique cities with college counts
  const cityMap = new Map<string, { city: string; state: string; count: number }>();
  
  (colleges || []).forEach((c: any) => {
    const key = `${c.city}|${c.state}`;
    const existing = cityMap.get(key);
    if (existing) {
      existing.count++;
    } else {
      cityMap.set(key, { city: c.city, state: c.state, count: 1 });
    }
  });

  const uniqueCities = Array.from(cityMap.values()).sort((a, b) => 
    a.city.localeCompare(b.city)
  );

  // Generate a consistent gradient for each city
  const getGradient = (cityName: string) => {
    const hash = cityName.split('').reduce((acc, char) => acc + char.charCodeAt(0), 0);
    return gradientSchemes[hash % gradientSchemes.length];
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950 py-12 relative overflow-hidden">
      {/* Simple Background Elements */}
      <div className="absolute inset-0 pointer-events-none opacity-30">
        {/* Subtle gradient overlays */}
        <div className="absolute top-0 left-0 w-96 h-96 bg-primary-500/20 rounded-full blur-3xl"></div>
        <div className="absolute bottom-0 right-0 w-96 h-96 bg-fuchsia-500/20 rounded-full blur-3xl"></div>
      </div>

      <div className="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="mb-12">
          <h1 className="text-4xl md:text-5xl font-bold text-white mb-3">
            Find Engineering Colleges by City
          </h1>
          <p className="text-lg text-slate-400">
            Browse {uniqueCities.length} cities • {colleges?.length || 0} engineering colleges across India
          </p>
        </div>

        {uniqueCities.length > 0 ? (
          <>
            {/* Featured Cities */}
            <div className="mb-10">
              <div className="flex items-center justify-between mb-4">
                <h2 className="text-2xl font-bold text-white">Top Engineering Cities</h2>
                <span className="text-sm text-slate-500">
                  {uniqueCities.filter((c: any) => c.count > 5).length} major hubs
                </span>
              </div>
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3">
                {uniqueCities
                  .sort((a, b) => b.count - a.count)
                  .slice(0, 8)
                  .map((cityData: any, index: number) => {
                    const gradient = getGradient(cityData.city);
                    
                    return (
                      <Link
                        key={`featured-${cityData.city}`}
                        href={`/colleges?city=${encodeURIComponent(cityData.city)}`}
                        className="group bg-white/5 border border-white/10 rounded-lg p-4 hover:bg-white/10 hover:border-primary-500/50 transition-all"
                      >
                        <div className="flex items-center gap-3 mb-2">
                          <div className={`w-12 h-12 rounded bg-gradient-to-br ${gradient} flex items-center justify-center text-white font-bold text-lg`}>
                            {cityData.city.charAt(0)}
                          </div>
                          <div className="flex-1 min-w-0">
                            <h3 className="font-semibold text-white truncate group-hover:text-primary-300 transition-colors">
                              {cityData.city}
                            </h3>
                            <p className="text-xs text-slate-500">{cityData.state}</p>
                          </div>
                        </div>
                        <div className="flex items-center justify-between text-sm">
                          <span className="text-slate-400">{cityData.count} colleges</span>
                          <svg 
                            className="h-4 w-4 text-slate-600 group-hover:text-primary-400 transition-colors" 
                            fill="none" 
                            viewBox="0 0 24 24" 
                            stroke="currentColor"
                          >
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                          </svg>
                        </div>
                      </Link>
                    );
                  })}
              </div>
            </div>

            {/* All Cities List */}
            <div className="bg-white/5 border border-white/10 rounded-lg p-6">
              <div className="flex items-center justify-between mb-5">
                <h2 className="text-xl font-bold text-white">All Cities</h2>
                <span className="text-sm bg-white/10 px-3 py-1 rounded-full text-slate-300">
                  {uniqueCities.length} total
                </span>
              </div>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-2">
                {uniqueCities.map((cityData: any) => (
                  <Link
                    key={`${cityData.city}-${cityData.state}`}
                    href={`/colleges?city=${encodeURIComponent(cityData.city)}`}
                    className="group flex items-center justify-between p-3 rounded hover:bg-white/10 transition-colors"
                  >
                    <div className="flex items-center gap-3 flex-1 min-w-0">
                      <MapPin className="h-4 w-4 text-slate-500 flex-shrink-0" />
                      <div className="flex-1 min-w-0">
                        <div className="font-medium text-white truncate group-hover:text-primary-300 transition-colors">
                          {cityData.city}
                        </div>
                        <div className="text-xs text-slate-500">{cityData.state}</div>
                      </div>
                    </div>
                    <div className="flex items-center gap-2 flex-shrink-0">
                      <span className="text-sm text-slate-400">{cityData.count}</span>
                      <svg 
                        className="h-4 w-4 text-slate-600 group-hover:text-primary-400 transition-colors" 
                        fill="none" 
                        viewBox="0 0 24 24" 
                        stroke="currentColor"
                      >
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                      </svg>
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          </>
        ) : (
          <div className="bg-white/5 backdrop-blur border border-white/10 rounded-2xl p-12 text-center animate-fade-in-up">
            <Building2 className="h-16 w-16 text-slate-600 mx-auto mb-4 animate-breathe" />
            <p className="text-slate-400 text-lg">No cities found yet.</p>
          </div>
        )}

        {/* Browse by State */}
        {uniqueCities.length > 0 && (
          <div className="mt-8 border-t border-white/10 pt-8">
            <h3 className="text-lg font-semibold text-white mb-3">Filter by State</h3>
            <div className="flex flex-wrap gap-2">
              {Array.from(new Set(uniqueCities.map((c: any) => c.state)))
                .sort()
                .map((state: string) => {
                  const stateCount = uniqueCities.filter((c: any) => c.state === state).length;
                  
                  return (
                    <Link
                      key={state}
                      href={`/colleges?state=${encodeURIComponent(state)}`}
                      className="px-3 py-1.5 bg-white/5 border border-white/10 rounded text-sm text-slate-300 hover:bg-white/10 hover:text-white hover:border-white/20 transition-all"
                    >
                      {state} <span className="text-slate-500">({stateCount})</span>
                    </Link>
                  );
                })}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
