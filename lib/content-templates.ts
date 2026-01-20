import { College, PlacementStats, Cutoff } from "@/types";

// ============================================
// CITY PAGE CONTENT TEMPLATES
// ============================================

export interface CityPageContent {
  heroTitle: string;
  heroSubtitle: string;
  introduction: string;
  whyStudyHere: string[];
  topCollegesIntro: string;
  admissionProcess: string;
  faqs: Array<{ question: string; answer: string }>;
}

export function generateCityPageContent(
  city: string,
  state: string,
  collegeCount: number,
  stats?: {
    avgPlacement?: number;
    topPlacement?: number;
    avgCutoff?: number;
  }
): CityPageContent {
  const currentYear = new Date().getFullYear();

  return {
    heroTitle: `Engineering Colleges in ${city}, ${state}`,
    heroSubtitle: `Explore ${collegeCount}+ top engineering colleges with detailed rankings, placements, and admission information`,

    introduction: `${city}, ${state} is home to ${collegeCount} prestigious engineering colleges offering world-class education and excellent placement opportunities. Students seeking admission to engineering colleges in ${city} can choose from IITs, NITs, IIITs, and other premier institutions. With an average placement package of ${stats?.avgPlacement ? `₹${(stats.avgPlacement / 100000).toFixed(1)} LPA` : "competitive packages"} and top companies recruiting from campuses, ${city} has emerged as a leading education hub in India.`,

    whyStudyHere: [
      `${collegeCount}+ engineering colleges with diverse specializations`,
      `Strong industry connections and placement opportunities`,
      `Excellent infrastructure and research facilities`,
      `Vibrant student life and cultural diversity`,
      `Strategic location with good connectivity`,
      `Affordable living costs compared to metro cities`,
    ],

    topCollegesIntro: `Here are the top-ranked engineering colleges in ${city} based on NIRF rankings, placement records, infrastructure, and student reviews:`,

    admissionProcess: `Admission to engineering colleges in ${city} is primarily through national-level entrance exams like JEE Main, JEE Advanced, and state-level exams. The admission process typically begins in ${currentYear} with online applications, followed by counseling rounds. Students should check individual college websites for specific eligibility criteria and admission schedules.`,

    faqs: [
      {
        question: `How many engineering colleges are there in ${city}?`,
        answer: `There are ${collegeCount}+ engineering colleges in ${city}, ${state}, including IITs, NITs, government colleges, and private institutions offering various engineering specializations.`,
      },
      {
        question: `What is the average placement package in ${city} engineering colleges?`,
        answer: stats?.avgPlacement
          ? `The average placement package in ${city} engineering colleges is approximately ₹${(stats.avgPlacement / 100000).toFixed(1)} LPA, with top colleges offering packages up to ₹${stats.topPlacement ? (stats.topPlacement / 100000).toFixed(1) : "50+"} LPA.`
          : `Placement packages in ${city} engineering colleges vary by institution and branch, with top colleges offering excellent opportunities with leading companies.`,
      },
      {
        question: `Which entrance exam is required for admission to ${city} engineering colleges?`,
        answer: `Most engineering colleges in ${city} accept JEE Main scores for admission. Premier institutions like IITs require JEE Advanced, while some state colleges may also accept state-level entrance exam scores.`,
      },
      {
        question: `What are the top engineering branches available in ${city}?`,
        answer: `Engineering colleges in ${city} offer popular branches including Computer Science, Electronics & Communication, Mechanical, Civil, Electrical, and emerging fields like AI/ML, Data Science, and Robotics.`,
      },
      {
        question: `Is ${city} a good place to study engineering?`,
        answer: `Yes, ${city} is an excellent choice for engineering education with ${collegeCount}+ quality institutions, strong industry connections, good infrastructure, and a conducive learning environment.`,
      },
    ],
  };
}

// ============================================
// COMPARISON PAGE CONTENT TEMPLATES
// ============================================

export interface ComparisonPageContent {
  heroTitle: string;
  introduction: string;
  comparisonCategories: string[];
  conclusion: string;
  relatedComparisons: string[];
}

export function generateComparisonPageContent(
  college1: College,
  college2: College
): ComparisonPageContent {
  const name1 = college1.short_name || college1.name;
  const name2 = college2.short_name || college2.name;

  return {
    heroTitle: `${name1} vs ${name2}: Detailed Comparison`,
    
    introduction: `Choosing between ${name1} and ${name2} is a crucial decision for aspiring engineering students. Both institutions are renowned for their academic excellence, but they differ in various aspects including rankings, placements, infrastructure, and campus life. This comprehensive comparison will help you make an informed choice based on your priorities and career goals.`,

    comparisonCategories: [
      "NIRF & Overall Rankings",
      "Placement Statistics & Top Recruiters",
      "Admission Cutoffs & Eligibility",
      "Fee Structure & Scholarships",
      "Infrastructure & Facilities",
      "Faculty & Research Output",
      "Campus Life & Student Activities",
      "Location & Connectivity",
    ],

    conclusion: `Both ${name1} and ${name2} are excellent institutions with their unique strengths. ${name1} excels in ${college1.city} with strong ${college1.institution_category} credentials, while ${name2} offers distinctive advantages in ${college2.city}. Your choice should depend on factors like preferred location, branch availability, placement goals, and personal priorities. Consider visiting both campuses if possible and interacting with current students for firsthand insights.`,

    relatedComparisons: [
      `${name1} vs other top colleges`,
      `${name2} vs other top colleges`,
      `Best colleges in ${college1.state}`,
      `Best colleges in ${college2.state}`,
    ],
  };
}

// ============================================
// RANKING PAGE CONTENT TEMPLATES
// ============================================

export interface RankingPageContent {
  heroTitle: string;
  introduction: string;
  rankingMethodology: string[];
  keyInsights: string[];
  howToUse: string;
}

export function generateRankingPageContent(
  category: string,
  categoryDisplay: string,
  collegeCount: number
): RankingPageContent {
  const currentYear = new Date().getFullYear();

  return {
    heroTitle: `Top ${collegeCount} ${categoryDisplay} Colleges in India ${currentYear}`,
    
    introduction: `This comprehensive ranking showcases the top ${collegeCount} ${categoryDisplay.toLowerCase()} colleges in India for ${currentYear}. Our rankings are based on multiple parameters including NIRF rankings, placement records, faculty quality, research output, and infrastructure. Whether you're a JEE aspirant or planning for higher education, this list will help you identify the best colleges for ${categoryDisplay.toLowerCase()}.`,

    rankingMethodology: [
      "NIRF Rankings & Government Recognition",
      "Placement Statistics (Average & Highest Packages)",
      "Faculty Qualifications & Student-Teacher Ratio",
      "Research Publications & Patents",
      "Infrastructure & Facilities",
      "Industry Collaborations & Internship Opportunities",
      "Alumni Success & Brand Value",
      "Student Reviews & Feedback",
    ],

    keyInsights: [
      `${collegeCount} colleges ranked based on comprehensive evaluation`,
      `Updated data for ${currentYear} admissions`,
      `Detailed comparison of placements and cutoffs`,
      `Branch-wise analysis and specializations`,
      `Admission process and eligibility criteria`,
    ],

    howToUse: `Use the filters to narrow down colleges based on your JEE rank, preferred location, branch, and budget. Click on any college to view detailed information including cutoffs, placements, fees, and admission process. You can also compare multiple colleges side-by-side to make an informed decision.`,
  };
}

// ============================================
// CUTOFF PAGE CONTENT TEMPLATES
// ============================================

export interface CutoffPageContent {
  heroTitle: string;
  introduction: string;
  eligibleColleges: string;
  admissionTips: string[];
  importantDates: string;
  faqs: Array<{ question: string; answer: string }>;
}

export function generateCutoffPageContent(
  rankRange: string,
  rangeDisplay: string,
  collegeCount: number,
  examType: string = "JEE Main"
): CutoffPageContent {
  const currentYear = new Date().getFullYear();

  return {
    heroTitle: `Colleges for ${examType} Rank ${rangeDisplay}`,
    
    introduction: `If you have secured a rank ${rangeDisplay} in ${examType} ${currentYear}, you have ${collegeCount}+ excellent engineering college options across India. This page provides a comprehensive list of colleges where you have strong chances of admission based on previous year cutoffs. We've analyzed historical data and trends to help you make strategic choices during counseling.`,

    eligibleColleges: `Based on ${examType} ${currentYear - 1} cutoff data, students with rank ${rangeDisplay} were successfully admitted to ${collegeCount}+ engineering colleges including NITs, IIITs, GFTIs, and top state government colleges. The actual cutoffs may vary slightly based on seat availability, reservation category, and counseling round.`,

    admissionTips: [
      `Apply to colleges where your rank is comfortably within the closing rank`,
      `Consider both home state and other state quotas for NITs`,
      `Keep multiple branch options open to maximize admission chances`,
      `Participate in all counseling rounds and spot rounds`,
      `Check previous 3 years' cutoff trends for better prediction`,
      `Consider college location, placements, and infrastructure beyond just rankings`,
      `Have backup options in lower preference colleges`,
    ],

    importantDates: `${examType} counseling for ${currentYear} typically begins in June-July. Stay updated with official JoSAA/CSAB websites for exact dates. Document verification and choice filling are crucial steps - ensure all certificates are ready.`,

    faqs: [
      {
        question: `Can I get admission with ${examType} rank ${rangeDisplay}?`,
        answer: `Yes, with rank ${rangeDisplay}, you have good chances of admission in ${collegeCount}+ engineering colleges including NITs, IIITs, and top state colleges. Your final admission depends on factors like category, state quota, and branch preference.`,
      },
      {
        question: `Which are the best colleges for rank ${rangeDisplay}?`,
        answer: `For rank ${rangeDisplay}, focus on NITs with lower closing ranks, top IIITs, GFTIs, and premier state government colleges. The best choice depends on your preferred branch and location.`,
      },
      {
        question: `What branches can I get with rank ${rangeDisplay}?`,
        answer: `With rank ${rangeDisplay}, you can typically get admission in core branches like Mechanical, Civil, Electrical in good NITs, and Computer Science/Electronics in newer IIITs and state colleges.`,
      },
      {
        question: `Should I wait for further counseling rounds?`,
        answer: `If you haven't secured your preferred college/branch in initial rounds, definitely participate in subsequent rounds. Cutoffs often decrease in later rounds due to seat vacancies.`,
      },
    ],
  };
}

// ============================================
// BRANCH PAGE CONTENT TEMPLATES
// ============================================

export interface BranchPageContent {
  heroTitle: string;
  introduction: string;
  careerProspects: string[];
  topRecruiters: string[];
  skillsRequired: string[];
}

export function generateBranchPageContent(
  branchName: string,
  branchFullName: string,
  collegeCount: number
): BranchPageContent {
  const currentYear = new Date().getFullYear();

  return {
    heroTitle: `Top ${branchFullName} Colleges in India`,
    
    introduction: `${branchFullName} (${branchName}) is one of the most sought-after engineering branches in India. With ${collegeCount}+ colleges offering this specialization, students have numerous options ranging from IITs and NITs to premier private institutions. This page provides comprehensive information about the best ${branchName} colleges, their placements, cutoffs, and admission process for ${currentYear}.`,

    careerProspects: [
      `Software Development & Engineering`,
      `Data Science & Analytics`,
      `Product Management`,
      `Research & Development`,
      `Consulting & Technical Advisory`,
      `Entrepreneurship & Startups`,
    ],

    topRecruiters: [
      `Google, Microsoft, Amazon`,
      `Goldman Sachs, Morgan Stanley`,
      `Flipkart, Swiggy, Zomato`,
      `TCS, Infosys, Wipro`,
      `Core Engineering Companies`,
    ],

    skillsRequired: [
      `Strong analytical and problem-solving abilities`,
      `Programming and technical skills`,
      `Communication and teamwork`,
      `Continuous learning mindset`,
      `Project management capabilities`,
    ],
  };
}
