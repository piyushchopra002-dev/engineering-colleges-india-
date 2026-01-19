"use client";

import { Shield, CheckCircle, Users, Database, Award, Clock } from "lucide-react";

export function TrustIndicators() {
  const indicators = [
    {
      icon: Shield,
      label: "Verified Data",
      value: "100%",
      color: "text-green-600",
      bgColor: "bg-green-50",
    },
    {
      icon: Users,
      label: "Active Users",
      value: "50K+",
      color: "text-blue-600",
      bgColor: "bg-blue-50",
    },
    {
      icon: Database,
      label: "Colleges Listed",
      value: "500+",
      color: "text-purple-600",
      bgColor: "bg-purple-50",
    },
    {
      icon: Award,
      label: "NIRF Verified",
      value: "2024",
      color: "text-orange-600",
      bgColor: "bg-orange-50",
    },
  ];

  return (
    <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
      {indicators.map((indicator, index) => (
        <div
          key={index}
          className={`${indicator.bgColor} rounded-lg p-4 text-center transition-all hover:scale-105 hover:shadow-md card-shimmer relative`}
          style={{ animationDelay: `${index * 0.1}s` }}
        >
          <div className={`flex justify-center mb-2 ${indicator.color}`}>
            <indicator.icon className="h-6 w-6 animate-breathe" style={{ animationDuration: `${3 + index * 0.5}s` }} />
          </div>
          <div className="font-bold text-lg text-gray-900">{indicator.value}</div>
          <div className="text-xs text-gray-600">{indicator.label}</div>
        </div>
      ))}
    </div>
  );
}

export function VerifiedBadge({ size = "sm" }: { size?: "sm" | "md" | "lg" }) {
  const sizeClasses = {
    sm: "text-xs px-2 py-1",
    md: "text-sm px-3 py-1.5",
    lg: "text-base px-4 py-2",
  };

  const iconSizes = {
    sm: "h-3 w-3",
    md: "h-4 w-4",
    lg: "h-5 w-5",
  };

  return (
    <div
      className={`inline-flex items-center gap-1.5 bg-green-100 text-green-800 rounded-full font-medium badge-shine ${sizeClasses[size]}`}
    >
      <CheckCircle className={`${iconSizes[size]} animate-breathe`} style={{ animationDuration: "3s" }} />
      <span>Verified</span>
    </div>
  );
}

export function DataSourceBadge() {
  return (
    <div className="inline-flex items-center gap-2 text-xs text-gray-500 bg-gray-50 px-3 py-1.5 rounded-full">
      <Database className="h-3 w-3" />
      <span>Source: NIRF, Official Websites</span>
    </div>
  );
}

export function LastUpdatedBadge({ date }: { date?: string }) {
  const displayDate = date || new Date().toLocaleDateString("en-IN", {
    day: "numeric",
    month: "short",
    year: "numeric",
  });

  return (
    <div className="inline-flex items-center gap-2 text-xs text-gray-500">
      <Clock className="h-3 w-3" />
      <span>Updated: {displayDate}</span>
    </div>
  );
}

export function TrustSection() {
  return (
    <section className="py-12 bg-gradient-to-br from-gray-50 to-white border-y border-gray-100 relative overflow-hidden">
      {/* Subtle Background Animation */}
      <div className="absolute inset-0 pointer-events-none">
        <div className="absolute top-10 left-10 w-64 h-64 bg-primary-500/5 rounded-full blur-3xl animate-float" style={{ animationDuration: "18s" }}></div>
        <div className="absolute bottom-10 right-10 w-72 h-72 bg-blue-500/5 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "5s", animationDuration: "20s" }}></div>
      </div>
      
      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Why Trust Our Data?</h2>
          <p className="text-gray-600">Verified information from official sources</p>
        </div>
        <TrustIndicators />
        <div className="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="text-center p-6 bg-white rounded-lg border border-gray-200 hover:border-primary-300 transition-all">
            <div className="w-12 h-12 bg-primary-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <Shield className="h-6 w-6 text-primary-600" />
            </div>
            <h3 className="font-semibold text-gray-900 mb-2">Official Sources</h3>
            <p className="text-sm text-gray-600">
              Data sourced directly from NIRF rankings, college websites, and government portals
            </p>
          </div>
          <div className="text-center p-6 bg-white rounded-lg border border-gray-200 hover:border-primary-300 transition-all">
            <div className="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <CheckCircle className="h-6 w-6 text-blue-600" />
            </div>
            <h3 className="font-semibold text-gray-900 mb-2">Verified Information</h3>
            <p className="text-sm text-gray-600">
              Every data point is cross-verified with multiple authentic sources
            </p>
          </div>
          <div className="text-center p-6 bg-white rounded-lg border border-gray-200 hover:border-primary-300 transition-all">
            <div className="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <Clock className="h-6 w-6 text-green-600" />
            </div>
            <h3 className="font-semibold text-gray-900 mb-2">Regular Updates</h3>
            <p className="text-sm text-gray-600">
              Our database is updated regularly to reflect the latest information
            </p>
          </div>
        </div>
      </div>
    </section>
  );
}
