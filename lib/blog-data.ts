export interface BlogPost {
  slug: string;
  title: string;
  excerpt: string;
  content: string;
  author: string;
  publishedDate: string;
  category: string;
  tags: string[];
  image: string;
  readTime: number;
}

export const blogCategories = [
  { slug: "admission-guide", name: "Admission Guides" },
  { slug: "jee-preparation", name: "JEE Preparation" },
  { slug: "placements", name: "Placements & Career" },
  { slug: "college-life", name: "College Life" },
  { slug: "branch-comparison", name: "Branch Comparison" },
  { slug: "exam-tips", name: "Exam Tips" },
];

export const blogPosts: BlogPost[] = [
  {
    slug: "how-to-prepare-for-jee-advanced-2026",
    title: "How to Prepare for JEE Advanced 2026: Complete Strategy Guide",
    excerpt: "A comprehensive guide to cracking JEE Advanced with proven strategies, study plans, and tips from IIT toppers. Master the most challenging engineering entrance exam in India.",
    content: `
# How to Prepare for JEE Advanced 2026: Complete Strategy Guide

JEE Advanced is the gateway to the prestigious IITs. With only 2.5 lakh students qualifying and 16,000 seats available, the competition is intense. This guide will help you develop a winning strategy.

## Understanding JEE Advanced

JEE Advanced is significantly tougher than JEE Main. It tests conceptual depth, analytical thinking, and problem-solving under time pressure. The exam has two papers, each lasting 3 hours, with questions from Physics, Chemistry, and Mathematics.

## 12-Month Preparation Timeline

### Months 1-4: Foundation Building
- Complete NCERT thoroughly for all three subjects
- Start with basic concepts from standard reference books
- Solve easy to medium-level problems
- Take weekly topic-based tests

### Months 5-8: Advanced Problem Solving
- Move to JEE Advanced level problems
- Solve previous 15 years' JEE Advanced papers
- Join a test series for regular practice
- Identify and work on weak areas

### Months 9-11: Intensive Practice
- Attempt full-length mock tests weekly
- Analyze mistakes and revise concepts
- Focus on speed and accuracy
- Solve problems from varied sources

### Month 12: Final Revision
- Revise all formulas and important concepts
- Solve last 5 years' papers again
- Take 2-3 mocks per week
- Stay calm and confident

## Subject-Wise Strategy

### Physics
- Focus on mechanics, electromagnetism, and modern physics
- Practice numerical problems extensively
- Understand concepts rather than memorizing
- Relate theory to real-world applications

**Best Books**: HC Verma, DC Pandey, NCERT, Previous Years' Papers

### Chemistry
- Give equal importance to all three branches
- NCERT is crucial for inorganic chemistry
- Practice organic reaction mechanisms
- Memorize important name reactions and reagents

**Best Books**: NCERT, MS Chauhan (Organic), JD Lee (Inorganic), RC Mukherjee (Physical)

### Mathematics
- Practice variety of problems for each topic
- Focus on calculus, algebra, and coordinate geometry
- Develop shortcuts for faster calculations
- Solve previous years' papers multiple times

**Best Books**: RD Sharma, Cengage Series, TMH, Past Papers

## Time Management Tips

1. **Create a Study Timetable**: Allocate time for each subject daily
2. **Focus on Weak Areas**: Spend more time on topics you find difficult
3. **Regular Breaks**: Take 10-15 minute breaks every 2 hours
4. **Sleep Well**: 7-8 hours of sleep is essential for retention
5. **Stay Healthy**: Exercise and eat nutritious food

## Test-Taking Strategy

1. **Attempt Easy Questions First**: Secure marks from questions you know
2. **Manage Time**: Don't spend too long on any single question
3. **Avoid Negative Marking**: Skip questions you're unsure about
4. **Stay Calm**: Don't panic if questions seem difficult
5. **Review Answers**: If time permits, review your responses

## Common Mistakes to Avoid

- Starting preparation too late
- Ignoring NCERT fundamentals
- Not taking enough mock tests
- Neglecting physical and mental health
- Getting demotivated by peer pressure

## Success Mantras from IIT Toppers

> "Consistency is more important than intensity. Study 6 hours daily rather than 14 hours for a few days." - AIR 7, JEE Advanced 2023

> "Solve previous years' papers at least thrice. They help you understand the exam pattern and difficulty level." - AIR 23, JEE Advanced 2023

> "Don't collect too many books. Master NCERT and 2-3 good reference books completely." - AIR 45, JEE Advanced 2023

## Conclusion

JEE Advanced preparation requires dedication, consistency, and smart work. Follow a structured approach, practice regularly, and stay motivated. Remember, it's not just about working hard but working smart. Good luck!
    `,
    author: "Rajesh Sharma",
    publishedDate: "2026-01-15",
    category: "jee-preparation",
    tags: ["JEE Advanced", "IIT", "Preparation Strategy", "Study Tips"],
    image: "/images/blog/jee-preparation.jpg",
    readTime: 12,
  },
  {
    slug: "iit-vs-nit-vs-iiit-complete-comparison-2026",
    title: "IIT vs NIT vs IIIT: Complete Comparison 2026 - Which is Better?",
    excerpt: "Confused between IIT, NIT, and IIIT? This detailed comparison covers placements, fees, campus life, and reputation to help you make the right choice.",
    content: `
# IIT vs NIT vs IIIT: Complete Comparison 2026

Choosing between IIT, NIT, and IIIT is one of the most important decisions for engineering aspirants. Let's compare these institutes across various parameters.

## Overview

### IITs (Indian Institutes of Technology)
- **Total Institutes**: 23 IITs
- **Established**: IIT Kharagpur (1951) was the first
- **Admission**: JEE Advanced
- **Autonomy**: Complete autonomous status
- **Reputation**: Highest among Indian institutes

### NITs (National Institutes of Technology)
- **Total Institutes**: 31 NITs
- **Established**: Regional Engineering Colleges converted to NITs
- **Admission**: JEE Main
- **Autonomy**: Institutes of National Importance
- **Reputation**: Second tier after IITs

### IIITs (Indian Institutes of Information Technology)
- **Total Institutes**: 25 IIITs
- **Established**: Most from 2008 onwards
- **Admission**: JEE Main
- **Autonomy**: Varies (some fully government, some PPP model)
- **Reputation**: Growing rapidly, especially for CS

## Placements Comparison

### IITs
- **Average Package**: ₹15-25 LPA (varies by IIT)
- **Highest Package**: ₹1+ Crore (IIT Bombay, Delhi, Madras)
- **Top Recruiters**: Google, Microsoft, Amazon, Goldman Sachs
- **Placement Rate**: 85-95%

### NITs
- **Average Package**: ₹8-15 LPA (varies by NIT)
- **Highest Package**: ₹40-60 LPA
- **Top Recruiters**: Microsoft, Amazon, Adobe, Qualcomm
- **Placement Rate**: 75-90%

### IIITs
- **Average Package**: ₹10-20 LPA (top IIITs)
- **Highest Package**: ₹40-50 LPA
- **Top Recruiters**: Google, Amazon, Microsoft (for CS branches)
- **Placement Rate**: 80-95% (for CS/IT branches)

## Fees Comparison

- **IITs**: ₹2-2.5 lakh per year
- **NITs**: ₹1.5-2 lakh per year
- **IIITs**: ₹2-3 lakh per year (varies for PPP model)

**Note**: All three offer fee waivers and scholarships for economically weaker sections.

## Branch vs College Dilemma

### When to Choose IIT
- You want the best brand value for higher studies abroad
- You're interested in research and academics
- You want diverse branch options
- You prefer a large, vibrant campus

### When to Choose NIT
- You prefer staying in your home state (state quota advantage)
- You want a good college with lower JEE Main cutoff
- You want core engineering exposure
- You prefer slightly lower fees than private colleges

### When to Choose IIIT
- You're specifically interested in CS/IT/ECE
- You want specialized curriculum in technology
- You prefer a focused, research-oriented environment
- You can get a good branch in IIIT vs average branch in NIT

## Campus Life

### IITs
- Large campuses (200+ acres)
- Most vibrant fests (Mood Indigo, Rendezvous, Shaastra)
- Strong alumni network globally
- Diverse student culture

### NITs
- Medium to large campuses
- Good cultural and technical fests
- Regional diversity
- Active sports and cultural activities

### IIITs
- Smaller campuses
- Growing fest culture
- Focus on technical activities
- Tight-knit community

## Research Opportunities

**IITs** > **Top IIITs** > **NITs**

IITs have the best research infrastructure and international collaborations. Top IIITs are catching up with specialized research centers.

## Our Recommendation

1. **Top 5-6 IITs (Any Branch)** > Lower IIT with good branch > Top NIT with good branch
2. **NIT CS/IT** > Lower IIT core branches (depends on interest)
3. **Top IIITs CS** ≈ **Mid-tier IITs core branches** ≈ **Top NITs CS**
4. **Old NITs with good branch** > **New IITs with average branch**

## Conclusion

There's no universal answer. Consider your rank, interests, career goals, and branch preferences. IITs offer the best overall package, NITs provide excellent value, and IIITs are perfect for CS enthusiasts.
    `,
    author: "Priya Singh",
    publishedDate: "2026-01-10",
    category: "admission-guide",
    tags: ["IIT", "NIT", "IIIT", "College Comparison"],
    image: "/images/blog/iit-nit-iiit-comparison.jpg",
    readTime: 10,
  },
  {
    slug: "top-10-engineering-branches-with-best-placements-2026",
    title: "Top 10 Engineering Branches with Best Placements in 2026",
    excerpt: "Discover which engineering branches offer the highest salaries and best job opportunities in 2026. Complete analysis with average packages and career prospects.",
    content: `
# Top 10 Engineering Branches with Best Placements in 2026

Choosing the right branch is crucial for your career. Here are the top engineering branches based on placement statistics, industry demand, and future prospects.

## 1. Computer Science & Engineering (CSE)

**Average Package**: ₹10-25 LPA (top colleges)
**Highest Package**: ₹1+ Crore
**Placement Rate**: 95-100%

### Why CSE Dominates
- Highest number of job opportunities
- Best packages across all sectors
- Flexibility to work in any domain
- Strong startup culture

### Career Options
- Software Engineer, Data Scientist, ML Engineer, Full Stack Developer, Cloud Architect

## 2. Artificial Intelligence & Machine Learning

**Average Package**: ₹12-28 LPA
**Highest Package**: ₹80 LPA+
**Placement Rate**: 90-95%

### Growing Demand
- AI/ML is transforming every industry
- Shortage of skilled professionals
- High-paying roles from day one
- Research opportunities

### Career Options
- ML Engineer, AI Researcher, Data Scientist, Computer Vision Engineer

## 3. Electronics & Communication Engineering (ECE)

**Average Package**: ₹8-18 LPA
**Highest Package**: ₹50 LPA+
**Placement Rate**: 85-95%

### Versatile Branch
- Can work in both core and software companies
- Strong foundation for VLSI, Embedded Systems
- Good for competitive exams
- Hardware + Software skills

### Career Options
- VLSI Engineer, Embedded Systems, IoT Developer, Software Engineer

## 4. Electrical Engineering (EE)

**Average Package**: ₹8-16 LPA
**Highest Package**: ₹40 LPA+
**Placement Rate**: 80-90%

### Core + Software Opportunities
- Power sector jobs
- Good for government jobs (UPSC, PSUs)
- Can switch to software domain
- Strong mathematical foundation

### Career Options
- Power Engineer, Control Systems, Software Engineer, Robotics

## 5. Data Science & Engineering

**Average Package**: ₹12-25 LPA
**Highest Package**: ₹60 LPA+
**Placement Rate**: 90-95%

### Data-Driven World
- Every company needs data scientists
- High-paying roles
- Diverse applications
- Growing field

### Career Options
- Data Scientist, Data Analyst, Business Intelligence, Data Engineer

## 6. Mechanical Engineering

**Average Package**: ₹6-12 LPA
**Highest Package**: ₹30 LPA+
**Placement Rate**: 70-85%

### Traditional but Stable
- Core manufacturing jobs
- Automotive industry
- Aerospace opportunities
- PSU jobs available

### Career Options
- Design Engineer, Production Engineer, R&D, Project Management

## 7. Chemical Engineering

**Average Package**: ₹7-15 LPA
**Highest Package**: ₹35 LPA+
**Placement Rate**: 75-85%

### Specialized Roles
- Pharmaceutical industry
- Oil & Gas sector
- Food processing
- PSU opportunities

### Career Options
- Process Engineer, R&D Scientist, Plant Manager, Quality Control

## 8. Aerospace Engineering

**Average Package**: ₹8-16 LPA
**Highest Package**: ₹40 LPA+
**Placement Rate**: 70-80%

### Niche but Exciting
- ISRO, DRDO opportunities
- Private space companies growing
- International opportunities
- Research-oriented

### Career Options
- Aircraft Design, Satellite Engineer, Flight Test Engineer, Research Scientist

## 9. Civil Engineering

**Average Package**: ₹5-10 LPA
**Highest Package**: ₹25 LPA+
**Placement Rate**: 65-80%

### Infrastructure Growth
- Government sector jobs
- Construction companies
- Real estate boom
- Urban planning

### Career Options
- Structural Engineer, Construction Manager, Urban Planner, Site Engineer

## 10. Biotechnology

**Average Package**: ₹5-12 LPA
**Highest Package**: ₹30 LPA+
**Placement Rate**: 60-75%

### Future-Oriented
- Healthcare revolution
- Pharmaceutical research
- Agricultural applications
- Growing field post-COVID

### Career Options
- Biotech Researcher, Quality Analyst, Pharmaceutical Scientist, R&D Engineer

## Branch Selection Tips

1. **Follow Your Interest**: Passion leads to excellence
2. **Consider Career Goals**: Research vs Industry vs Entrepreneurship
3. **Check College Strength**: Some branches are better in specific colleges
4. **Future Prospects**: Consider 10-year outlook
5. **Backup Options**: Can you switch domains if needed?

## Conclusion

While CSE dominates placements, each branch has its own merits. Choose based on your interests, aptitude, and career aspirations rather than just package statistics.
    `,
    author: "Amit Kumar",
    publishedDate: "2026-01-05",
    category: "branch-comparison",
    tags: ["Engineering Branches", "Placements", "Career Guidance"],
    image: "/images/blog/engineering-branches.jpg",
    readTime: 15,
  },
  {
    slug: "branch-vs-college-what-matters-more",
    title: "Branch vs College: What Should You Prioritize in 2026?",
    excerpt: "The age-old dilemma: Should you choose your preferred branch in a lower-tier college or an average branch in a top college? Find the answer based on data and expert opinions.",
    content: `
# Branch vs College: What Should You Prioritize?

This is perhaps the most debated question among engineering aspirants. Let's analyze this systematically.

## The Traditional Wisdom

### "Branch Matters More" Camp Says:
- Passionate students excel in their field
- Right skills lead to good placements
- You'll study the subject for 4 years
- Career satisfaction is important

### "College Matters More" Camp Says:
- IIT/NIT tag opens doors
- Better peer group and facilities
- Alumni network is valuable
- You can learn anything later

## Data-Driven Analysis

### Scenario 1: CS in Tier-2 College vs Core in Top IIT

**CS in Tier-2**:
- Average Package: ₹6-10 LPA
- Placement Rate: 80-90%
- Limited core company visits
- Self-study crucial for top jobs

**Mechanical in IIT**:
- Average Package: ₹10-15 LPA
- Placement Rate: 85-95%
- Can switch to software roles
- Strong alumni network

**Verdict**: IIT Mechanical wins for most students

### Scenario 2: CS in Mid-Tier NIT vs CS in Top Private College

**CS in Mid-Tier NIT**:
- Avg Package: ₹8-12 LPA
- Government institute benefits
- Lower fees (₹6-8 lakhs total)
- Good placement assistance

**CS in Top Private (BITS/VIT/SRM)**:
- Avg Package: ₹10-15 LPA (BITS)
- Excellent industry connections
- Higher fees (₹16-20 lakhs total)
- Modern curriculum

**Verdict**: Depends on financial situation

### Scenario 3: CS in New IIT vs CS in Old NIT

**CS in New IIT**:
- IIT brand value
- Growing but limited alumni network
- Package: ₹12-18 LPA
- Better for higher studies abroad

**CS in Old NIT**:
- Established alumni network
- Proven placement record
- Package: ₹10-15 LPA
- Regional advantage

**Verdict**: CS in new IIT slightly better

## Decision Framework

### Choose Branch When:
1. You have a strong passion for the subject
2. You're certain about your career path
3. The branch is CS/ECE/EE in a decent college
4. You're planning for specialization later
5. You can self-study and upskill

### Choose College When:
1. You're unsure about your interests
2. You want flexibility to explore
3. You're aiming for higher studies abroad
4. You value peer learning
5. The college difference is significant (IIT vs Tier-3)

## Real-World Examples

### Success from Lower Tier:
Many students from Tier-2/3 colleges get into Google, Microsoft through:
- Consistent coding practice
- Strong projects and internships
- Competition programming
- Open source contributions

### Success from Top Colleges:
Top college students often:
- Get PPOs from top companies
- Have better networking opportunities
- Transition easily between domains
- Get admits from top foreign universities

## Expert Opinions

### From Industry HR:
> "For first job, college matters. For second job onwards, your skills and experience matter." - Google Recruiter

### From IIT Alumnus:
> "IIT gave me confidence, peer group, and opportunities. But determined students from anywhere can succeed." - IIT Bombay Alumnus

### From Startup Founder:
> "We care about skills and passion, not where you studied. But top college students often have better soft skills." - Startup CTO

## Our Recommendation

### General Priority Order:
1. Top 5-6 IITs (any branch except unpopular ones)
2. CS/AI/DS in any IIT
3. CS/ECE in top NITs (Trichy, Surathkal, Warangal)
4. EE in top IITs
5. CS in mid-tier NITs
6. Core branches in top IITs
7. CS in new IITs/IIITs
8. CS in good state/private colleges

### Decision Checklist:
- [ ] What's your career goal? (Industry/Research/PSU/Entrepreneurship)
- [ ] How strong is your self-learning ability?
- [ ] Can you afford coaching/courses if needed?
- [ ] Do you have a backup plan?
- [ ] What's your aptitude and interest?

## Conclusion

There's no universal answer. For most students, a good branch in a decent college is better than an average branch in a top college. However, if you're getting into top 5-6 IITs, the branch matters less initially.

Remember: Your success depends more on your efforts than just the college or branch name.
    `,
    author: "Sneha Patel",
    publishedDate: "2026-01-01",
    category: "admission-guide",
    tags: ["Branch Selection", "College Selection", "Career Guidance"],
    image: "/images/blog/branch-vs-college.jpg",
    readTime: 12,
  },
  {
    slug: "how-to-get-internship-in-second-year",
    title: "How to Get an Internship in Your Second Year: Complete Guide",
    excerpt: "Second-year internships can lead to amazing opportunities. Learn how to prepare, where to apply, and what skills you need to land your first tech internship.",
    content: `
# How to Get an Internship in Your Second Year

Landing an internship in your second year might seem challenging, but it's definitely possible with the right preparation and strategy.

## Why Second Year Internships Matter

1. **Early Industry Exposure**: Understand what actual development looks like
2. **Resume Building**: Stand out when applying for third-year internships
3. **Skill Validation**: Test your skills in real-world scenarios
4. **Networking**: Build connections early in your career
5. **PPO Possibility**: Some companies offer PPOs even from second year

## Skills to Develop

### For Software Internships

**Essential Skills**:
- One programming language (Python/Java/C++) proficiency
- Data Structures and Algorithms (basic to intermediate)
- Git and GitHub basics
- Basic understanding of databases
- One web technology (React/Node.js/Django)

**Timeline**:
- Month 1-2: Learn programming basics
- Month 3-4: Practice DSA (LeetCode/CodeChef)
- Month 5-6: Build 2-3 projects
- Month 7+: Start applying

### Project Ideas
1. **Portfolio Website**: Showcase your work
2. **To-Do App**: Learn CRUD operations
3. **Weather App**: Work with APIs
4. **Chat Application**: Real-time features
5. **Blog Platform**: Full-stack development

## Where to Apply

### Startup Internships
**Platforms**:
- Internshala
- AngelList
- LinkedIn
- Twitter (follow startup founders)

**Pros**:
- More responsibilities
- Faster learning
- Direct interaction with founders
- Flexible selection process

**Cons**:
- Lower or no stipend sometimes
- Less structured training
- Uncertain future

### Corporate Internships
**Companies with Second Year Programs**:
- Microsoft Engage
- Google STEP
- Amazon Future Engineer
- Goldman Sachs Engineering Essentials
- JP Morgan Code for Good

**Pros**:
- Good stipend
- Structured program
- Brand value on resume
- Potential PPO

**Cons**:
- Highly competitive
- Formal application process
- Limited spots

### College Programs
- Summer research internships
- Teaching assistant positions
- Campus startups
- Lab projects

## Application Strategy

### Resume Tips
1. **Keep it one page**
2. **Highlight projects prominently**
3. **Quantify achievements** (e.g., "Improved loading time by 40%")
4. **Include relevant coursework**
5. **Add GitHub profile link**
6. **Showcase hackathon participations**

### Cover Letter
- Research the company
- Explain why you're interested
- Highlight relevant skills
- Show enthusiasm
- Keep it concise (250-300 words)

### Technical Preparation

**DSA Preparation** (2-3 months):
- Week 1-4: Arrays, Strings, Basic Math
- Week 5-8: Searching, Sorting, Recursion
- Week 9-12: Trees, Graphs, DP basics
- Practice: LeetCode Easy (100+ problems)

**Development Skills**:
- Complete 2-3 meaningful projects
- Contribute to open source
- Participate in hackathons
- Write technical blogs

## Interview Process

### Round 1: Resume Screening
- Ensure error-free resume
- Highlight relevant projects
- Showcase passion through work

### Round 2: Online Assessment
- Usually 2-3 DSA questions
- 60-90 minutes duration
- Focus on correctness first, then optimization

### Round 3: Technical Interview
- DSA questions (1-2)
- Project discussion
- Basic CS fundamentals
- Problem-solving approach

### Round 4: HR Round
- Why this company?
- Career goals
- Availability
- Expectations from internship

## Success Stories

### From Tier-2 College to Microsoft
> "I started preparing from day one of second year. Solved 200+ LeetCode problems, built 3 projects, and applied to 50+ companies. Got Microsoft Engage internship." - Rajesh, NIT Jalandhar

### From Zero to Hero
> "Didn't know programming in first year. Learned Python, built web apps, and got internship at a funded startup. Stipend was ₹20k/month." - Priya, VIT Vellore

## Common Mistakes to Avoid

1. **Starting Late**: Begin preparation from start of second year
2. **No Projects**: Theory alone won't help
3. **Only Big Companies**: Apply to startups too
4. **Poor Resume**: Get it reviewed multiple times
5. **Giving Up**: Rejections are normal, keep applying

## Action Plan

### Semester Break (After 1st Year)
- Learn one programming language thoroughly
- Complete one web development course
- Build your first project

### Start of Second Year
- Join coding clubs
- Start DSA practice
- Participate in hackathons

### Mid Second Year (October-December)
- Complete 2-3 projects
- Solve 100+ DSA problems
- Update resume and LinkedIn
- Start applying

### End of Second Year (January-April)
- Apply to 50+ companies
- Give interviews
- Continue upskilling

## Resources

### Learning Platforms
- freeCodeCamp (Web Development)
- LeetCode (DSA)
- GeeksforGeeks (CS Concepts)
- YouTube (Project tutorials)

### Communities
- Reddit (r/developersIndia)
- Discord (CS communities)
- LinkedIn groups
- College seniors

## Conclusion

Getting a second-year internship is challenging but achievable. Start early, work consistently, and don't get discouraged by rejections. Every application is a learning opportunity.

Remember: Quality of learning matters more than the brand name of your internship.
    `,
    author: "Vikas Gupta",
    publishedDate: "2025-12-28",
    category: "placements",
    tags: ["Internships", "Career Tips", "Second Year"],
    image: "/images/blog/internship-guide.jpg",
    readTime: 14,
  },
];

export function getBlogBySlug(slug: string): BlogPost | undefined {
  return blogPosts.find(post => post.slug === slug);
}

export function getBlogsByCategory(category: string): BlogPost[] {
  return blogPosts.filter(post => post.category === category);
}

export function getAllBlogs(): BlogPost[] {
  return blogPosts.sort((a, b) => 
    new Date(b.publishedDate).getTime() - new Date(a.publishedDate).getTime()
  );
}

export function generateBlogSchema(post: BlogPost, baseUrl: string) {
  return {
    "@context": "https://schema.org",
    "@type": "BlogPosting",
    "headline": post.title,
    "image": `${baseUrl}${post.image}`,
    "author": {
      "@type": "Person",
      "name": post.author
    },
    "publisher": {
      "@type": "Organization",
      "name": "Engineering Colleges India",
      "logo": {
        "@type": "ImageObject",
        "url": `${baseUrl}/logo.png`
      }
    },
    "datePublished": post.publishedDate,
    "description": post.excerpt,
    "articleBody": post.content
  };
}
