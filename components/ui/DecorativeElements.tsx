"use client";

import { Sparkles, Star } from "lucide-react";

export function FloatingBadge({ children, className = "" }: { children: React.ReactNode; className?: string }) {
  return (
    <div className={`inline-flex items-center gap-1 ${className} animate-bounce`}>
      <Sparkles className="h-4 w-4 text-yellow-500" />
      {children}
    </div>
  );
}

export function SectionDivider({ icon: Icon, text }: { icon?: any; text?: string }) {
  return (
    <div className="flex items-center justify-center my-12">
      <div className="flex-1 h-px bg-gradient-to-r from-transparent via-gray-300 to-transparent"></div>
      {(Icon || text) && (
        <div className="mx-4 flex items-center gap-2 text-gray-400">
          {Icon && <Icon className="h-5 w-5" />}
          {text && <span className="text-sm font-medium">{text}</span>}
        </div>
      )}
      <div className="flex-1 h-px bg-gradient-to-r from-transparent via-gray-300 to-transparent"></div>
    </div>
  );
}

export function DecorativeBlob({ className = "", color = "primary" }: { className?: string; color?: string }) {
  const colorClasses = {
    primary: "bg-primary-500/10",
    blue: "bg-blue-500/10",
    purple: "bg-purple-500/10",
    pink: "bg-pink-500/10",
  };

  return (
    <div
      className={`absolute rounded-full blur-3xl ${colorClasses[color as keyof typeof colorClasses]} ${className}`}
      style={{ pointerEvents: "none" }}
    />
  );
}

export function StarRating({ rating, maxRating = 5 }: { rating: number; maxRating?: number }) {
  return (
    <div className="flex items-center gap-1">
      {Array.from({ length: maxRating }).map((_, i) => (
        <Star
          key={i}
          className={`h-4 w-4 ${
            i < rating ? "text-yellow-500 fill-yellow-500" : "text-gray-300"
          }`}
        />
      ))}
      <span className="text-sm text-gray-600 ml-1">({rating.toFixed(1)})</span>
    </div>
  );
}

export function ProgressBar({ label, value, max = 100, color = "primary" }: {
  label: string;
  value: number;
  max?: number;
  color?: string;
}) {
  const percentage = (value / max) * 100;
  
  const colorClasses = {
    primary: "bg-primary-500",
    blue: "bg-blue-500",
    green: "bg-green-500",
    orange: "bg-orange-500",
  };

  return (
    <div className="w-full">
      <div className="flex justify-between text-sm mb-1">
        <span className="text-gray-700 font-medium">{label}</span>
        <span className="text-gray-600">{value}%</span>
      </div>
      <div className="w-full bg-gray-200 rounded-full h-2 overflow-hidden">
        <div
          className={`h-full rounded-full transition-all duration-500 ${colorClasses[color as keyof typeof colorClasses]}`}
          style={{ width: `${percentage}%` }}
        />
      </div>
    </div>
  );
}

export function PulsingDot({ color = "green" }: { color?: string }) {
  const colorClasses = {
    green: "bg-green-500",
    blue: "bg-blue-500",
    red: "bg-red-500",
    yellow: "bg-yellow-500",
  };

  return (
    <span className="relative flex h-3 w-3">
      <span className={`animate-ping absolute inline-flex h-full w-full rounded-full opacity-75 ${colorClasses[color as keyof typeof colorClasses]}`}></span>
      <span className={`relative inline-flex rounded-full h-3 w-3 ${colorClasses[color as keyof typeof colorClasses]}`}></span>
    </span>
  );
}

export function InfoTooltip({ children, tooltip }: { children: React.ReactNode; tooltip: string }) {
  return (
    <div className="group relative inline-block">
      {children}
      <div className="invisible group-hover:visible opacity-0 group-hover:opacity-100 transition-all absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 px-3 py-2 bg-gray-900 text-white text-xs rounded-lg whitespace-nowrap z-10">
        {tooltip}
        <div className="absolute top-full left-1/2 transform -translate-x-1/2 -mt-1">
          <div className="border-4 border-transparent border-t-gray-900"></div>
        </div>
      </div>
    </div>
  );
}
