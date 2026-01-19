import Link from "next/link";
import {
  TrendingUp,
  Briefcase,
  FileText,
  Calendar,
  Map,
  BarChart3,
} from "lucide-react";

const quickLinks = [
  {
    title: "Rankings",
    description: "NIRF, QS, THE, and ARWU rankings",
    icon: TrendingUp,
    href: "/rankings",
    color: "bg-blue-500",
  },
  {
    title: "Placements",
    description: "Company-wise placement statistics",
    icon: Briefcase,
    href: "/placements",
    color: "bg-green-500",
  },
  {
    title: "Cutoffs",
    description: "JEE Main & Advanced cutoffs",
    icon: FileText,
    href: "/cutoffs",
    color: "bg-purple-500",
  },
  {
    title: "Events",
    description: "Cultural, technical, and sports events",
    icon: Calendar,
    href: "/events",
    color: "bg-pink-500",
  },
  {
    title: "City Life",
    description: "Nearby attractions and activities",
    icon: Map,
    href: "/cities",
    color: "bg-orange-500",
  },
  {
    title: "Compare",
    description: "Side-by-side college comparison",
    icon: BarChart3,
    href: "/compare",
    color: "bg-indigo-500",
  },
];

export function QuickLinks() {
  return (
    <section className="py-16 bg-transparent relative overflow-hidden">
      {/* Background Animations */}
      <div className="absolute inset-0 pointer-events-none">
        <div className="absolute top-10 left-1/4 w-64 h-64 bg-primary-500/10 rounded-full blur-3xl animate-float" style={{ animationDuration: "18s" }}></div>
        <div className="absolute bottom-10 right-1/4 w-72 h-72 bg-fuchsia-500/10 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "6s", animationDuration: "20s" }}></div>
      </div>
      
      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 className="text-3xl font-bold text-white mb-8 text-center">
          Explore More
        </h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {quickLinks.map((link, index) => (
            <Link
              key={link.href}
              href={link.href}
              className="group p-6 bg-white/5 border border-white/10 rounded-xl hover:border-primary-500/50 hover:shadow-2xl backdrop-blur card-lift relative overflow-hidden"
              style={{ animationDelay: `${index * 0.1}s` }}
            >
              {/* Gradient overlay on hover */}
              <div className="absolute inset-0 bg-gradient-to-br from-primary-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity"></div>
              
              <div className="relative">
                <div className={`${link.color} w-12 h-12 rounded-lg flex items-center justify-center mb-4 group-hover:scale-110 group-hover:rotate-3 transition-all duration-300`}>
                  <link.icon className="h-6 w-6 text-white" />
                </div>
                <h3 className="text-xl font-semibold text-white mb-2 group-hover:text-primary-300 transition-colors">
                  {link.title}
                </h3>
                <p className="text-slate-300 group-hover:text-slate-200 transition-colors">{link.description}</p>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  );
}
