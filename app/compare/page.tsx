import { Metadata } from "next";
import { ComparisonTool } from "@/components/compare/ComparisonTool";

export const metadata: Metadata = {
  title: "Compare Engineering Colleges | Side-by-Side Comparison",
  description:
    "Compare multiple engineering colleges side-by-side. Compare rankings, placements, cutoffs, infrastructure, fees, and more. Get AI-powered insights.",
};

export default function ComparePage() {
  return <ComparisonTool />;
}
