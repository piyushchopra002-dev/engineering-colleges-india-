import { Metadata } from "next";
import { AIChat } from "@/components/chat/AIChat";

export const metadata: Metadata = {
  title: "AI College Counselor | Virtual Counseling for Engineering Colleges",
  description:
    "Get AI-powered counseling for engineering college selection. Ask questions about rankings, placements, cutoffs, and get personalized recommendations.",
};

export default function ChatPage() {
  return <AIChat />;
}
