import { GraduationCap, Users, Briefcase, Calendar } from "lucide-react";
import Link from "next/link";

interface AdminDashboardProps {
  stats: {
    colleges: number;
    faculty: number;
    placements: number;
    events: number;
  };
}

export function AdminDashboard({ stats }: AdminDashboardProps) {
  const statCards = [
    {
      label: "Colleges",
      value: stats.colleges,
      icon: GraduationCap,
      href: "/admin/colleges",
      color: "bg-blue-500",
    },
    {
      label: "Faculty",
      value: stats.faculty,
      icon: Users,
      href: "/admin/faculty",
      color: "bg-green-500",
    },
    {
      label: "Placements",
      value: stats.placements,
      icon: Briefcase,
      href: "/admin/placements",
      color: "bg-purple-500",
    },
    {
      label: "Events",
      value: stats.events,
      icon: Calendar,
      href: "/admin/events",
      color: "bg-pink-500",
    },
  ];

  return (
    <div>
      <h1 className="text-3xl font-bold text-gray-900 mb-8">Admin Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {statCards.map((stat) => (
          <Link
            key={stat.href}
            href={stat.href}
            className="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow"
          >
            <div className="flex items-center justify-between">
              <div>
                <p className="text-gray-600 text-sm mb-1">{stat.label}</p>
                <p className="text-3xl font-bold text-gray-900">{stat.value}</p>
              </div>
              <div className={`${stat.color} p-3 rounded-lg`}>
                <stat.icon className="h-6 w-6 text-white" />
              </div>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}
