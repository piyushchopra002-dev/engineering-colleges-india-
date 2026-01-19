import { NextResponse } from "next/server";

export async function GET() {
  const apiKeyConfigured = !!process.env.OPENROUTER_API_KEY;
  
  return NextResponse.json({
    apiKeyConfigured,
    mode: apiKeyConfigured ? "live" : "demo",
  });
}
