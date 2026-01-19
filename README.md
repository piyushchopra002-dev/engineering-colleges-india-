# Best Engineering Colleges in India

A production-ready, scalable, SEO-optimized web platform for discovering and comparing engineering colleges in India.

## Features

- **Comprehensive College Directory**: Browse 5000+ engineering colleges with detailed information
- **AI-Powered Counseling**: Virtual counselor powered by Meta LLaMA models via OpenRouter
- **College Comparison**: Side-by-side comparison of multiple colleges
- **Programmatic SEO**: Auto-generated pages for colleges, branches, cities, and more
- **Media Integration**: YouTube and Instagram embeds for campus tours and events
- **Faculty Profiles**: Verified faculty profiles with qualifications and research
- **Placement Analytics**: Company-wise placement statistics and trends
- **Cutoff Intelligence**: Historical cutoff data with proof links
- **City Life Guide**: Nearby attractions and activities for each college city
- **Achievements Showcase**: Year-wise achievements with extraordinary highlights
- **Admin Panel**: Complete CRUD interface for content management

## Tech Stack

- **Framework**: Next.js 14 (App Router)
- **Styling**: Tailwind CSS
- **Database**: Supabase (PostgreSQL + Auth + Storage)
- **AI**: OpenRouter API (Meta LLaMA models)
- **Maps**: Google Places API
- **Deployment**: Vercel (recommended)

## Getting Started

### Prerequisites

- Node.js 18+ and npm/yarn
- Supabase account
- OpenRouter API key
- Google Places API key

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd "college project"
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
```bash
cp .env.local.example .env.local
```

Edit `.env.local` with your credentials:
```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
OPENROUTER_API_KEY=your_openrouter_api_key
NEXT_PUBLIC_GOOGLE_PLACES_API_KEY=your_google_places_api_key
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

4. Set up the database:
   - Create a new Supabase project
   - Run the SQL schema from `supabase/schema.sql` in your Supabase SQL editor

5. Run the development server:
```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## Project Structure

```
├── app/                    # Next.js App Router pages
│   ├── admin/             # Admin panel pages
│   ├── colleges/          # College pages
│   ├── compare/           # Comparison tool
│   ├── chat/              # AI chat interface
│   └── ...
├── components/            # React components
│   ├── admin/            # Admin components
│   ├── colleges/         # College-related components
│   ├── compare/          # Comparison components
│   ├── chat/             # Chat components
│   └── layout/           # Layout components
├── lib/                   # Utility functions
│   ├── supabase/        # Supabase clients
│   ├── openrouter.ts    # AI integration
│   ├── google-places.ts  # Maps integration
│   └── seo.ts           # SEO utilities
├── supabase/             # Database schema
│   └── schema.sql       # Complete database schema
└── types/               # TypeScript types
```

## Key Features Implementation

### Programmatic SEO

The platform generates thousands of SEO-optimized pages:
- `/colleges/[slug]` - Individual college pages
- `/branches/[slug]` - Branch-specific pages
- `/cities/[city-slug]` - City-based pages
- `/colleges/[slug]/faculty` - Faculty listing pages
- And more...

### AI Chat Integration

The AI counselor uses OpenRouter API with Meta LLaMA models:
- Context-aware responses using verified database data
- Chat history per user
- Fallback to rule-based logic

### Comparison Tool

- Compare up to 5 colleges side-by-side
- AI-generated insights
- Export and share functionality
- Highlight best values per criteria

### Media Integration

- YouTube video embeds with lazy loading
- Instagram content integration
- Privacy-friendly embeds (respects cookie consent)
- Video schema markup for SEO

## Database Schema

The database includes tables for:
- Colleges, Rankings, Branches
- Faculty, Infrastructure, Libraries
- Placements, Companies, Cutoffs
- Events, Achievements
- City Attractions, Media
- User data, Comparisons, Chat history

See `supabase/schema.sql` for the complete schema.

## SEO Features

- Structured data (JSON-LD) for all pages
- Sitemap generation (`/sitemap.xml`)
- Robots.txt configuration
- Meta tags optimization
- Open Graph and Twitter cards
- Breadcrumb navigation

## Performance

- ISR (Incremental Static Regeneration)
- Edge caching
- Image optimization with Next.js Image
- Lazy loading for media
- Code splitting

## Admin Panel

Access the admin panel at `/admin` (requires admin authentication).

Features:
- CRUD operations for all data types
- Faculty verification workflow
- Content moderation
- Analytics dashboard

## Deployment

### Vercel (Recommended)

1. Push your code to GitHub
2. Import project in Vercel
3. Add environment variables
4. Deploy

### Other Platforms

The app can be deployed to any platform supporting Next.js:
- Netlify
- AWS Amplify
- Railway
- DigitalOcean App Platform

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

[Your License Here]

## Support

For issues and questions, please open an issue on GitHub.

## Roadmap

- [ ] Mobile app
- [ ] Advanced analytics
- [ ] User reviews and ratings
- [ ] Scholarship information
- [ ] Admission counseling booking
- [ ] Newsletter and alerts
