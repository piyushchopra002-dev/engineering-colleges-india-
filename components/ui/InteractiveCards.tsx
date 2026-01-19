"use client";

import { useState } from "react";
import { Star, Heart, Share2, Bookmark, ExternalLink } from "lucide-react";
import Link from "next/link";

// Flip Card Component
export function FlipCard({ 
  front, 
  back 
}: { 
  front: React.ReactNode; 
  back: React.ReactNode;
}) {
  const [isFlipped, setIsFlipped] = useState(false);

  return (
    <div
      className="relative w-full h-64 cursor-pointer"
      onMouseEnter={() => setIsFlipped(true)}
      onMouseLeave={() => setIsFlipped(false)}
    >
      <div className={`absolute inset-0 transition-all duration-500 transform ${isFlipped ? "rotate-y-180" : ""}`}>
        <div className={`absolute inset-0 ${isFlipped ? "opacity-0" : "opacity-100"} transition-opacity duration-300`}>
          {front}
        </div>
        <div className={`absolute inset-0 ${isFlipped ? "opacity-100" : "opacity-0"} transition-opacity duration-300 rotate-y-180`}>
          {back}
        </div>
      </div>
    </div>
  );
}

// Interactive Info Card with Hover Effects
export function InteractiveInfoCard({
  title,
  description,
  stats,
  link,
}: {
  title: string;
  description: string;
  stats: { label: string; value: string }[];
  link: string;
}) {
  const [isLiked, setIsLiked] = useState(false);
  const [isBookmarked, setIsBookmarked] = useState(false);

  return (
    <div className="group relative bg-white/5 border border-white/10 rounded-xl p-6 hover:bg-white/10 transition-all overflow-hidden">
      {/* Animated Background */}
      <div className="absolute inset-0 bg-gradient-to-br from-primary-500/20 to-fuchsia-500/20 opacity-0 group-hover:opacity-100 transition-opacity"></div>
      
      {/* Content */}
      <div className="relative z-10">
        <div className="flex items-start justify-between mb-4">
          <h3 className="text-xl font-bold text-white group-hover:text-primary-300 transition-colors">
            {title}
          </h3>
          <div className="flex gap-2">
            <button
              onClick={() => setIsLiked(!isLiked)}
              className={`p-2 rounded-full transition-all ${
                isLiked ? "bg-red-500 text-white" : "bg-white/10 text-white/60 hover:bg-white/20"
              }`}
            >
              <Heart className={`h-4 w-4 ${isLiked ? "fill-current" : ""}`} />
            </button>
            <button
              onClick={() => setIsBookmarked(!isBookmarked)}
              className={`p-2 rounded-full transition-all ${
                isBookmarked ? "bg-yellow-500 text-white" : "bg-white/10 text-white/60 hover:bg-white/20"
              }`}
            >
              <Bookmark className={`h-4 w-4 ${isBookmarked ? "fill-current" : ""}`} />
            </button>
          </div>
        </div>
        
        <p className="text-slate-300 mb-4">{description}</p>
        
        <div className="grid grid-cols-2 gap-3 mb-4">
          {stats.map((stat, index) => (
            <div key={index} className="bg-white/5 rounded-lg p-3">
              <div className="text-2xl font-bold text-white">{stat.value}</div>
              <div className="text-xs text-slate-400">{stat.label}</div>
            </div>
          ))}
        </div>
        
        <Link
          href={link}
          className="flex items-center gap-2 text-primary-400 hover:text-primary-300 transition-colors font-medium"
        >
          Learn More <ExternalLink className="h-4 w-4" />
        </Link>
      </div>
      
      {/* Hover Glow */}
      <div className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none">
        <div className="absolute top-0 left-0 w-32 h-32 bg-primary-500/30 rounded-full blur-3xl"></div>
        <div className="absolute bottom-0 right-0 w-32 h-32 bg-fuchsia-500/30 rounded-full blur-3xl"></div>
      </div>
    </div>
  );
}

// Rating Stars Interactive
export function InteractiveRating({ 
  initialRating = 0,
  onRate 
}: { 
  initialRating?: number;
  onRate?: (rating: number) => void;
}) {
  const [rating, setRating] = useState(initialRating);
  const [hover, setHover] = useState(0);

  const handleRate = (value: number) => {
    setRating(value);
    onRate?.(value);
  };

  return (
    <div className="flex gap-1">
      {[1, 2, 3, 4, 5].map((value) => (
        <button
          key={value}
          onClick={() => handleRate(value)}
          onMouseEnter={() => setHover(value)}
          onMouseLeave={() => setHover(0)}
          className="transition-transform hover:scale-125"
        >
          <Star
            className={`h-6 w-6 transition-colors ${
              value <= (hover || rating)
                ? "fill-yellow-400 text-yellow-400"
                : "text-gray-400"
            }`}
          />
        </button>
      ))}
    </div>
  );
}

// Animated Counter on Scroll
export function AnimatedStatCard({
  icon: Icon,
  value,
  label,
  suffix = "",
}: {
  icon: any;
  value: number;
  label: string;
  suffix?: string;
}) {
  const [count, setCount] = useState(0);
  const [hasAnimated, setHasAnimated] = useState(false);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting && !hasAnimated) {
          setHasAnimated(true);
          const duration = 2000;
          const steps = 60;
          const increment = value / steps;
          let current = 0;

          const timer = setInterval(() => {
            current += increment;
            if (current >= value) {
              setCount(value);
              clearInterval(timer);
            } else {
              setCount(Math.floor(current));
            }
          }, duration / steps);
        }
      },
      { threshold: 0.5 }
    );

    const element = document.getElementById(`stat-${label}`);
    if (element) observer.observe(element);

    return () => observer.disconnect();
  }, [value, label, hasAnimated]);

  return (
    <div
      id={`stat-${label}`}
      className="group bg-gradient-to-br from-white/10 to-white/5 border border-white/20 rounded-2xl p-6 hover:from-white/20 hover:to-white/10 transition-all cursor-pointer transform hover:scale-105"
    >
      <div className="flex items-center gap-4">
        <div className="w-16 h-16 bg-gradient-to-br from-primary-500 to-fuchsia-500 rounded-xl flex items-center justify-center group-hover:scale-110 transition-transform">
          <Icon className="h-8 w-8 text-white" />
        </div>
        <div>
          <div className="text-4xl font-bold text-white">
            {count}{suffix}
          </div>
          <div className="text-slate-400">{label}</div>
        </div>
      </div>
    </div>
  );
}

function useEffect(arg0: () => void, arg1: (number | string | boolean)[]) {
  throw new Error("Function not implemented.");
}
