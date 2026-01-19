"use client";

import { ComparisonTool } from "@/components/compare/ComparisonTool";
import { useSearchParams } from "next/navigation";
import { Suspense } from "react";

function CompareContent() {
  const searchParams = useSearchParams();
  const collegeIds = searchParams.get("colleges")?.split(",").filter(Boolean) || [];
  
  return <ComparisonTool initialCollegeIds={collegeIds} />;
}

export default function ComparePage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-slate-950 flex items-center justify-center">
        <div className="text-white text-lg">Loading comparison...</div>
      </div>
    }>
      <CompareContent />
    </Suspense>
  );
}
