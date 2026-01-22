export interface FAQItem {
  question: string;
  answer: string;
  category: string;
}

export const faqCategories = [
  { slug: "admission", name: "Admission & Eligibility" },
  { slug: "placements", name: "Placements & Career" },
  { slug: "cutoffs", name: "Cutoffs & Selection" },
  { slug: "branch-selection", name: "Branch Selection" },
  { slug: "jee-preparation", name: "JEE Preparation" },
  { slug: "college-life", name: "College Life" },
  { slug: "fees-scholarships", name: "Fees & Scholarships" },
];

export const faqs: FAQItem[] = [
  // Admission & Eligibility
  {
    question: "What are the eligibility criteria for admission to engineering colleges?",
    answer: "To be eligible for admission to engineering colleges in India, you must have completed 10+2 with Physics, Chemistry, and Mathematics as core subjects. Most colleges require a minimum of 75% marks (65% for SC/ST) in 10+2. For IITs and NITs, you need to qualify JEE Advanced and JEE Main respectively. Some state colleges accept state-level entrance exams.",
    category: "admission"
  },
  {
    question: "How does the JoSAA counseling process work?",
    answer: "JoSAA (Joint Seat Allocation Authority) conducts centralized counseling for IITs, NITs, IIITs, and GFTIs. The process involves registration, choice filling, seat allocation (usually 6 rounds), and document verification. You need to fill your college and branch preferences in order of priority. Seats are allocated based on your JEE rank, category, and preferences. After seat allocation, you must pay the fee and complete document verification to confirm your seat.",
    category: "admission"
  },
  {
    question: "Can I get admission without JEE?",
    answer: "Yes, many private and state colleges offer direct admission or conduct their own entrance exams. Some universities like VIT, SRM, Manipal, and BITS conduct their own entrance tests (VITEEE, SRMJEEE, MET, BITSAT). State government colleges often accept state-level entrance exam scores. However, for IITs, NITs, and IIITs, JEE is mandatory.",
    category: "admission"
  },
  {
    question: "What is the difference between IIT, NIT, and IIIT?",
    answer: "IITs (Indian Institutes of Technology) are premier autonomous institutes with the highest reputation, toughest admission (JEE Advanced), and excellent placements. NITs (National Institutes of Technology) are government institutes under JEE Main, offering quality education and good placements. IIITs (Indian Institutes of Information Technology) focus primarily on IT and CS, some are government-funded while others are public-private partnerships. All three are excellent institutions with slightly different focuses and admission processes.",
    category: "admission"
  },

  // Placements & Career
  {
    question: "What is the average placement package in top engineering colleges?",
    answer: "Average placement packages vary significantly by college tier. Top IITs (Bombay, Delhi, Madras) have average packages of ₹15-25 LPA, with highest going up to ₹1+ Crore. Other IITs average ₹10-18 LPA. Top NITs average ₹8-15 LPA. Tier-1 private colleges like BITS Pilani average ₹10-15 LPA. State government colleges typically average ₹4-8 LPA. CSE and EE branches usually get higher packages than other branches.",
    category: "placements"
  },
  {
    question: "Which engineering branch has the best placement opportunities?",
    answer: "Computer Science & Engineering (CSE) consistently has the best placement opportunities across all colleges, with highest packages and most offers. Other branches with excellent placements include Electronics & Communication (ECE), Electrical Engineering (EE), and Mathematics & Computing. Core branches like Mechanical, Civil, and Chemical have good placements in top IITs/NITs but fewer offers in lower-tier colleges. Recent trends show AI/ML and Data Science gaining popularity.",
    category: "placements"
  },
  {
    question: "Do companies prefer IIT/NIT students over others?",
    answer: "Top-tier companies (Google, Microsoft, Amazon, etc.) do prefer IIT/NIT students initially due to brand value and rigorous selection. However, they also hire from other good colleges if students demonstrate strong skills. Many companies now focus more on skills, projects, and coding abilities rather than just college name. Students from any college can succeed with strong fundamentals, good projects, and interview preparation. Networking and internships also play a crucial role.",
    category: "placements"
  },
  {
    question: "How important are internships for placements?",
    answer: "Internships are extremely important for placements. They provide practical experience, industry exposure, and networking opportunities. Many companies prefer candidates with internship experience. Summer internships after 2nd/3rd year can lead to Pre-Placement Offers (PPOs). Internships in reputed companies add significant value to your resume. They help you understand industry requirements and make informed career choices. Start applying for internships from your second year.",
    category: "placements"
  },

  // Cutoffs & Selection
  {
    question: "What JEE rank is needed to get into IIT?",
    answer: "To get into any IIT, you generally need a JEE Advanced rank under 15,000 (General category). For top IITs (Bombay, Delhi, Madras, Kanpur, Kharagpur) and popular branches (CSE, EE), you need rank under 1,000-3,000. For other branches in top IITs, rank under 5,000-8,000 is competitive. For newer/smaller IITs, ranks up to 15,000 can get you admission. SC/ST/OBC categories have lower cutoffs. The cutoffs vary each year based on difficulty and seat availability.",
    category: "cutoffs"
  },
  {
    question: "How do JEE Main and JEE Advanced cutoffs differ?",
    answer: "JEE Main cutoffs are percentile-based (usually 90+ for good NITs/IIITs). JEE Advanced uses absolute ranks. JEE Main qualifying marks are around 85-90 percentile for General category. Top NITs require 97-99+ percentile for CSE. IITs need good JEE Advanced ranks (under 10,000 for most courses). State quota in NITs has lower cutoffs than All India quota. Category reservations significantly affect cutoffs - SC/ST cutoffs can be 40-50% lower than General category.",
    category: "cutoffs"
  },
  {
    question: "Do cutoffs change every year?",
    answer: "Yes, cutoffs fluctuate every year based on several factors: exam difficulty, number of applicants, seat availability, and previous year trends. A harder exam can lower cutoffs, while an easier exam raises them. New IITs/NITs starting often have lower cutoffs initially. Branch-wise preferences also shift cutoffs - rising CSE demand has increased its cutoffs significantly. Category-wise cutoffs also vary. It's best to check last 3 years' trends for accurate prediction.",
    category: "cutoffs"
  },

  // Branch Selection
  {
    question: "Should I choose branch or college?",
    answer: "This depends on your career goals and interests. If you're passionate about a specific field and sure about your interest, prioritize branch - good branch in a decent college opens many doors. If you're unsure about your branch and want broader opportunities, prioritize college - IIT/NIT tag provides extensive opportunities regardless of branch. For CS/IT careers, branch matters more. For higher studies abroad, college brand helps. For core engineering jobs, branch is crucial. Consider placements, faculty, and your genuine interest.",
    category: "branch-selection"
  },
  {
    question: "Is CSE the only branch with good placement?",
    answer: "No, this is a myth. While CSE has the highest placement percentages and packages across most colleges, other branches also offer excellent opportunities. Electrical and Electronics branches have good placements in both core and software companies. Mechanical, Civil, and Chemical have strong placements in top IITs/NITs. Core companies value core branch students. Many students also switch to software roles through self-study. Choose based on interest rather than just placement statistics.",
    category: "branch-selection"
  },
  {
    question: "Can I change my branch after first year?",
    answer: "Yes, many colleges allow branch change after first year based on CGPA. Top IITs allow branch change if you're in top 10-20% of your current branch. NITs have similar policies with varying criteria (usually top 10-15%). The process is competitive and limited seats are available. Requirements vary by college - some require minimum 9+ CGPA. Popular branches like CSE have very few seats available for transfer. Check your college's specific policy during admission.",
    category: "branch-selection"
  },

  // JEE Preparation
  {
    question: "When should I start preparing for JEE?",
    answer: "Ideally, start JEE preparation from Class 11. This gives you 2 years for thorough preparation. However, starting from Class 12 is also manageable with focused efforts. Class 10 is too early unless you're highly motivated. Consistency matters more than start time. Create a structured study plan covering NCERT thoroughly first, then move to JEE-level problems. Join a test series for regular practice. Starting earlier allows more revisions and less stress.",
    category: "jee-preparation"
  },
  {
    question: "Is coaching necessary for JEE?",
    answer: "Coaching is not absolutely necessary but can be helpful. Many students crack JEE through self-study using online resources, YouTube lectures, and books. However, coaching provides structure, experienced faculty, peer competition, and regular tests. If you're disciplined and self-motivated, online coaching or self-study works well. If you need guidance and motivation, offline coaching helps. The key is consistent practice, solving previous years' papers, and taking mock tests regularly.",
    category: "jee-preparation"
  },
  {
    question: "How many hours should I study for JEE?",
    answer: "Quality matters more than quantity. In Class 11, study 4-6 hours daily with focus on building concepts. In Class 12, increase to 6-8 hours daily, including practice and revision. During JEE Main/Advanced months, 8-10 hours is common. Take regular breaks to avoid burnout. Focus on productive study - understanding concepts, solving problems, and taking tests - rather than just sitting with books. Maintain balance with school, sleep (7-8 hours), and some recreation.",
    category: "jee-preparation"
  },
  {
    question: "Which books are best for JEE preparation?",
    answer: "For Physics: HC Verma (concepts), DC Pandey (problems), NCERT. For Chemistry: NCERT (most important), MS Chauhan (Organic), JD Lee (Inorganic), RC Mukherjee (Physical). For Mathematics: RD Sharma, Cengage Series, TMH (for practice). Start with NCERT thoroughly first. Previous years' JEE papers are crucial - solve at least last 15 years. Join test series for practice. Don't collect too many books; master few good ones completely.",
    category: "jee-preparation"
  },

  // College Life
  {
    question: "What is hostel life like in engineering colleges?",
    answer: "Hostel life is a unique experience with both challenges and memories. Most IITs/NITs have mandatory hostel stay for first year. Rooms are typically shared (2-3 people). Facilities include mess (food quality varies), common rooms, sports facilities, and Wi-Fi. You learn independence, time management, and make lifelong friends. Ragging is banned and strictly punished. Most colleges have anti-ragging committees. Senior-junior interaction is friendly. Cultural and technical fests add excitement to hostel life.",
    category: "college-life"
  },
  {
    question: "How active are extracurricular activities?",
    answer: "Top engineering colleges have very active extracurricular scenes. IITs/NITs have numerous clubs - technical (robotics, coding, quiz), cultural (music, dance, drama, literature), sports, and social service. Major annual fests attract participants from across India. Inter-IIT/NIT sports and cultural competitions are highly competitive. Students balance academics with activities. Participation helps develop soft skills, leadership, and network. Some students also do internships, research, or startup projects during college.",
    category: "college-life"
  },
  {
    question: "Is there gender diversity in engineering colleges?",
    answer: "Gender diversity has improved but still needs work. IITs have around 20-25% female students (increased from 8% due to supernumerary seats for women). NITs have similar ratios. Private colleges often have better gender ratios (30-40%). Colleges are safe with 24/7 security, separate hostels, and strict policies. Active Women in Engineering cells and support systems exist. More women are joining engineering every year. CSE and ECE branches have higher female participation than core branches.",
    category: "college-life"
  },

  // Fees & Scholarships
  {
    question: "What are the fees for engineering colleges in India?",
    answer: "Fees vary widely by college type. IITs charge around ₹2-2.5 lakhs per year (tuition + hostel). NITs charge ₹1.5-2 lakhs per year. BITS Pilani and top private colleges charge ₹4-6 lakhs per year. State government colleges charge ₹40,000-1 lakh per year. Private colleges range from ₹1-5 lakhs per year. Total 4-year B.Tech cost: IITs/NITs: ₹8-10 lakhs, Private: ₹16-24 lakhs, State: ₹2-4 lakhs. Additional costs include books, personal expenses, and travel.",
    category: "fees-scholarships"
  },
  {
    question: "Are scholarships available for engineering students?",
    answer: "Yes, numerous scholarships are available. Government schemes: NSP (National Scholarship Portal) for SC/ST/OBC/Minority students, Merit-cum-Means scholarship in IITs/NITs for family income under ₹1 lakh/year (covers full tuition). Private scholarships: Inspire Scholarship (₹80,000/year for top JEE rankers), various company scholarships, State government scholarships. Most colleges have fee waivers for economically weaker sections. Educational loans at low interest are also available. Research assistantships in higher semesters.",
    category: "fees-scholarships"
  },
  {
    question: "Can I get education loan for engineering?",
    answer: "Yes, education loans are readily available for engineering education. Most banks (SBI, HDFC, ICICI, Canara) offer education loans up to ₹20-40 lakhs for Indian colleges. Interest rates are around 7-10% (lower for top colleges). No collateral needed for loans up to ₹7.5 lakhs. Repayment starts after course completion + 6-12 months. Tax benefits available under Section 80E. For IIT/NIT/Top colleges, loan approval is easier. Many banks have special schemes for premier institutions.",
    category: "fees-scholarships"
  },
];

export function getFAQsByCategory(category: string): FAQItem[] {
  return faqs.filter(faq => faq.category === category);
}

export function getAllFAQs(): FAQItem[] {
  return faqs;
}

export function generateFAQSchema(faqs: FAQItem[]) {
  return {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": faqs.map(faq => ({
      "@type": "Question",
      "name": faq.question,
      "acceptedAnswer": {
        "@type": "Answer",
        "text": faq.answer
      }
    }))
  };
}
