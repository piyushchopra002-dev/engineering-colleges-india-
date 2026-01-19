export function CollegeCardSkeleton() {
  return (
    <div className="bg-slate-900/50 border border-slate-800 rounded-xl overflow-hidden animate-pulse">
      <div className="aspect-video bg-slate-800"></div>
      <div className="p-4">
        <div className="h-5 bg-slate-800 rounded mb-3"></div>
        <div className="h-4 bg-slate-800 rounded w-2/3 mb-3"></div>
        <div className="flex gap-2">
          <div className="h-6 bg-slate-800 rounded w-20"></div>
          <div className="h-6 bg-slate-800 rounded w-24"></div>
        </div>
      </div>
    </div>
  );
}

export function CollegeGridSkeleton({ count = 12 }: { count?: number }) {
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
      {Array.from({ length: count }).map((_, i) => (
        <CollegeCardSkeleton key={i} />
      ))}
    </div>
  );
}

export function StatCardSkeleton() {
  return (
    <div className="bg-white/5 border border-white/10 rounded-2xl py-8 backdrop-blur animate-pulse">
      <div className="flex justify-center mb-4">
        <div className="p-4 bg-white/10 rounded-full w-16 h-16"></div>
      </div>
      <div className="h-10 bg-white/10 rounded w-24 mx-auto mb-2"></div>
      <div className="h-4 bg-white/10 rounded w-32 mx-auto"></div>
    </div>
  );
}
