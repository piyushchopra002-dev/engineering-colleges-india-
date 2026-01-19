"use client";

import { GraduationCap, MapPin } from "lucide-react";
import { useEffect, useRef, useState } from "react";

interface StatsSectionProps {
  colleges: number;
  cities: number;
}

function AnimatedCounter({ end, duration = 2000 }: { end: number; duration?: number }) {
  const [count, setCount] = useState(0);
  const [isVisible, setIsVisible] = useState(false);
  const counterRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting) {
          setIsVisible(true);
        }
      },
      { threshold: 0.3 }
    );

    if (counterRef.current) {
      observer.observe(counterRef.current);
    }

    return () => observer.disconnect();
  }, []);

  useEffect(() => {
    if (!isVisible) return;

    const startTime = Date.now();
    const endTime = startTime + duration;

    const updateCount = () => {
      const now = Date.now();
      const progress = Math.min((now - startTime) / duration, 1);
      const easeOutQuad = 1 - Math.pow(1 - progress, 3);
      const current = Math.floor(easeOutQuad * end);

      setCount(current);

      if (now < endTime) {
        requestAnimationFrame(updateCount);
      } else {
        setCount(end);
      }
    };

    requestAnimationFrame(updateCount);
  }, [isVisible, end, duration]);

  return (
    <div ref={counterRef} className="text-3xl md:text-4xl font-bold text-white mb-2">
      {count.toLocaleString("en-IN")}+
    </div>
  );
}

export function StatsSection({
  colleges,
  cities,
}: StatsSectionProps) {
  const stats = [
    {
      icon: GraduationCap,
      value: colleges,
      label: "Engineering Colleges",
    },
    {
      icon: MapPin,
      value: cities,
      label: "Cities Covered",
    },
  ];

  return (
    <section className="py-16 bg-transparent relative overflow-hidden">
      {/* Subtle Background Animation */}
      <div className="absolute inset-0 pointer-events-none">
        <div className="absolute top-0 left-1/4 w-64 h-64 bg-primary-500/10 rounded-full blur-3xl animate-pulse"></div>
        <div className="absolute bottom-0 right-1/4 w-64 h-64 bg-blue-500/10 rounded-full blur-3xl animate-pulse" style={{ animationDelay: "1s" }}></div>
      </div>
      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-2 md:grid-cols-2 gap-8">
          {stats.map((stat, index) => (
            <div
              key={index}
              className="text-center bg-white/5 border border-white/10 rounded-2xl py-8 backdrop-blur card-lift transition-smooth hover:bg-white/10 hover:border-primary-500/50"
              style={{ animationDelay: `${index * 0.1}s` }}
            >
              <div className="flex justify-center mb-4">
                <div className="p-4 bg-white/10 rounded-full transition-smooth hover:bg-primary-500/20 hover:scale-110">
                  <stat.icon className="h-8 w-8 text-primary-300" />
                </div>
              </div>
              <AnimatedCounter end={stat.value} />
              <div className="text-slate-300">{stat.label}</div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
