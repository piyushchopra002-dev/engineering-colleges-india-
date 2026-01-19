import { createSupabaseServerClient } from "./supabase/server";

const OPENROUTER_API_KEY = process.env.OPENROUTER_API_KEY;
const OPENROUTER_API_URL = "https://openrouter.ai/api/v1/chat/completions";

export interface ChatMessage {
  role: "user" | "assistant" | "system";
  content: string;
}

export interface ChatContext {
  colleges?: Array<{
    id: string;
    name: string;
    slug: string;
  }>;
  branches?: Array<{
    id: string;
    name: string;
  }>;
  userRank?: number;
  preferences?: Record<string, any>;
}

// Demo mode responses when API key is not available
function generateDemoResponse(userMessage: string, context?: ChatContext): string {
  const query = userMessage.toLowerCase();
  
  if (query.includes("compare") && query.includes("iit")) {
    return `Based on the latest NIRF rankings and placement data:

**IIT Bombay vs IIT Delhi**

**Rankings:**
• IIT Bombay: NIRF Rank #3 (2024)
• IIT Delhi: NIRF Rank #2 (2024)

**Placements (CSE):**
• IIT Bombay: Average ₹20-22 LPA, Highest ₹1.8 Cr
• IIT Delhi: Average ₹18-20 LPA, Highest ₹2 Cr

**Key Differences:**
• Location: Mumbai (Bombay) vs New Delhi
• Campus: IIT Bombay has larger campus area
• Alumni Network: Both excellent, slight edge to Bombay in tech startups

**Recommendation:** Both are top-tier institutions. Choose based on location preference and specific department strengths.`;
  }
  
  if (query.includes("rank") && query.includes("5000")) {
    return `For a rank around 5000 in JEE Advanced/Mains, here are excellent options:

**Top Choices:**
1. **NIT Trichy** - CS/IT (Cutoff: ~4500-6000)
   - Excellent placements (Avg: ₹12-15 LPA)
   - Strong alumni network

2. **NIT Warangal** - ECE/EEE (Cutoff: ~5000-6500)
   - Great infrastructure
   - Good campus placement record

3. **IIIT Hyderabad** - CSE (if you qualify)
   - Premier coding culture
   - Top tech companies recruit

4. **Top State Colleges:**
   - Delhi Technological University (DTU)
   - PES University, Bangalore

**My Advice:** Focus on NITs in top cities for better internship opportunities and placement prospects.`;
  }
  
  if (query.includes("cutoff") || query.includes("nit trichy")) {
    return `**NIT Trichy Cutoffs (JEE Main 2024):**

**CSE:** 
- General: 300-500 rank
- OBC: 800-1200 rank
- SC: 2500-3500 rank

**ECE:**
- General: 1200-1800 rank
- OBC: 2500-3500 rank

**Mechanical:**
- General: 3500-5000 rank

**Note:** Cutoffs vary year to year based on paper difficulty and seat availability. These are approximate ranges.

Would you like cutoff information for a specific branch or category?`;
  }
  
  if (query.includes("placement") || query.includes("bits pilani")) {
    return `**BITS Pilani Placements 2024:**

**Overall Statistics:**
• Average Package: ₹15-18 LPA
• Highest Package: ₹60+ LPA
• Placement Rate: 85-90%

**Top Recruiters:**
• Google, Microsoft, Amazon
• Flipkart, Adobe, Oracle
• Goldman Sachs, Deutsche Bank

**Branch-wise Average:**
• CSE: ₹22-25 LPA
• ECE: ₹18-20 LPA
• Mechanical: ₹12-15 LPA

**Campus Culture:**
BITS is known for excellent coding culture, entrepreneurship, and flexible course structure.`;
  }
  
  if (query.includes("budget") || query.includes("cheap") || query.includes("affordable")) {
    return `**Best Value Engineering Colleges (Government/Affordable):**

**Under ₹2 LPA/year:**
1. **NITs** - ₹1.5 LPA approx
2. **IIITs (Government)** - ₹1.5-2 LPA
3. **State Government Colleges** - ₹50k-1 LPA

**Under ₹5 LPA/year:**
1. **VIT Vellore** - ₹1.98 LPA
2. **Manipal** - ₹3.5 LPA
3. **PES University** - ₹2.5-4 LPA

**Tips for Budget:**
• Government colleges offer best value
• Check for scholarships (INSPIRE, state scholarships)
• Merit-based fee waivers at many private colleges

What's your budget range?`;
  }

  return `I can help you with detailed information about:

• **College Comparisons** - Compare any engineering colleges
• **Rankings** - NIRF, placement statistics
• **Cutoffs** - JEE Main/Advanced cutoffs for all colleges
• **Placements** - Average packages, top recruiters
• **College Selection** - Based on your rank and preferences
• **Branch Advice** - Which branch to choose

Could you please ask me a specific question? For example:
- "Compare IIT Bombay vs NIT Trichy for CSE"
- "Best colleges for rank 10000"
- "What are BITS Pilani placement statistics?"`;
}

export async function generateAIResponse(
  messages: ChatMessage[],
  context?: ChatContext
): Promise<string> {
  // Use demo mode if API key is not configured
  if (!OPENROUTER_API_KEY) {
    const lastUserMessage = messages[messages.length - 1];
    if (lastUserMessage.role === "user") {
      return generateDemoResponse(lastUserMessage.content, context);
    }
    return "Hello! How can I help you with college selection today?";
  }

  const systemPrompt = `You are an expert virtual counselor for engineering college admissions in India. 
You help students make informed decisions about college selection based on verified data.

Guidelines:
- Only use verified data from the database
- Be objective and factual
- Compare colleges fairly
- Consider rankings, placements, cutoffs, infrastructure, and location
- If data is unavailable, clearly state that
- Provide actionable advice
- Be encouraging but realistic

${context ? `Context: ${JSON.stringify(context, null, 2)}` : ""}`;

  const response = await fetch(OPENROUTER_API_URL, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${OPENROUTER_API_KEY}`,
      "HTTP-Referer": process.env.NEXT_PUBLIC_APP_URL || "",
      "X-Title": "Best Engineering Colleges in India",
    },
    body: JSON.stringify({
      model: "meta-llama/llama-3.1-70b-instruct",
      messages: [
        { role: "system", content: systemPrompt },
        ...messages,
      ],
      temperature: 0.7,
      max_tokens: 1000,
    }),
  });

  if (!response.ok) {
    const error = await response.text();
    throw new Error(`OpenRouter API error: ${error}`);
  }

  const data = await response.json();
  return data.choices[0]?.message?.content || "I apologize, but I couldn't generate a response.";
}

export async function getContextualData(query: string): Promise<ChatContext> {
  const supabase = createSupabaseServerClient();
  const context: ChatContext = {};

  // Extract college names from query
  const collegeMatches = query.match(/\b(IIT|NIT|IIIT|BITS|VIT|SRM|Manipal|Amity)\s+[A-Za-z]+\b/gi);
  if (collegeMatches) {
    const { data: colleges } = await supabase
      .from("colleges")
      .select("id, name, slug")
      .ilike("name", `%${collegeMatches[0]}%`)
      .limit(5);
    if (colleges) context.colleges = colleges;
  }

  // Extract branch names
  const branchMatches = query.match(/\b(CSE|ECE|ME|CE|EE|EEE|IT|CS)\b/gi);
  if (branchMatches) {
    const { data: branches } = await supabase
      .from("branches")
      .select("id, name")
      .ilike("name", `%${branchMatches[0]}%`)
      .limit(5);
    if (branches) context.branches = branches;
  }

  // Extract rank
  const rankMatch = query.match(/(?:rank|ranked|ranking)\s*:?\s*(\d+)/i);
  if (rankMatch) {
    context.userRank = parseInt(rankMatch[1]);
  }

  return context;
}
