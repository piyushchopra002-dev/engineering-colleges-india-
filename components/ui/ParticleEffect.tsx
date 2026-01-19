"use client";

import { useEffect, useRef } from "react";

export function ParticleEffect({ count = 20 }: { count?: number }) {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const container = containerRef.current;
    if (!container) return;

    const particles: HTMLDivElement[] = [];

    for (let i = 0; i < count; i++) {
      const particle = document.createElement("div");
      particle.className = "particle";
      particle.style.left = `${Math.random() * 100}%`;
      particle.style.animationDuration = `${10 + Math.random() * 15}s`;
      particle.style.animationDelay = `${Math.random() * 5}s`;
      particle.style.animation = `particle-float ${10 + Math.random() * 15}s linear infinite`;
      particle.style.opacity = `${0.3 + Math.random() * 0.3}`;
      
      const size = 2 + Math.random() * 4;
      particle.style.width = `${size}px`;
      particle.style.height = `${size}px`;
      
      container.appendChild(particle);
      particles.push(particle);
    }

    return () => {
      particles.forEach((p) => p.remove());
    };
  }, [count]);

  return (
    <div
      ref={containerRef}
      className="absolute inset-0 pointer-events-none overflow-hidden"
      style={{ zIndex: 1 }}
    />
  );
}

export function CircuitLines() {
  return (
    <div className="absolute inset-0 pointer-events-none overflow-hidden opacity-20">
      <svg className="w-full h-full" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <linearGradient id="line-gradient" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stopColor="#a855f7" stopOpacity="0" />
            <stop offset="50%" stopColor="#a855f7" stopOpacity="0.5" />
            <stop offset="100%" stopColor="#a855f7" stopOpacity="0" />
          </linearGradient>
        </defs>
        <path
          d="M 0 100 Q 250 50 500 100 T 1000 100"
          stroke="url(#line-gradient)"
          strokeWidth="2"
          fill="none"
          className="animate-pulse"
        />
        <path
          d="M 200 0 Q 400 150 600 50 T 1000 200"
          stroke="url(#line-gradient)"
          strokeWidth="2"
          fill="none"
          className="animate-pulse"
          style={{ animationDelay: "1s" }}
        />
        <circle cx="250" cy="75" r="4" fill="#a855f7" className="glow-pulse" />
        <circle cx="500" cy="100" r="4" fill="#d946ef" className="glow-pulse" style={{ animationDelay: "0.5s" }} />
        <circle cx="750" cy="75" r="4" fill="#a855f7" className="glow-pulse" style={{ animationDelay: "1s" }} />
      </svg>
    </div>
  );
}
