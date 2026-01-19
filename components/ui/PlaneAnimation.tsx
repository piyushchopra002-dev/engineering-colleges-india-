'use client';

import { motion } from 'framer-motion';
import { useEffect, useState } from 'react';

export function PlaneAnimation() {
  const [shouldAnimate, setShouldAnimate] = useState(false);

  useEffect(() => {
    // Trigger animation on mount (when user enters the website)
    setShouldAnimate(true);
  }, []);

  if (!shouldAnimate) return null;

  return (
    <motion.div
      className="fixed pointer-events-none z-[9999]"
      initial={{
        x: -100,
        y: -50,
        rotate: 0,
      }}
      animate={{
        x: [
          -100,
          window.innerWidth * 0.15,
          window.innerWidth * 0.35,
          window.innerWidth * 0.5,
          window.innerWidth * 0.65,
          window.innerWidth * 0.85,
          window.innerWidth + 100,
        ],
        y: [
          -50,
          window.innerHeight * 0.15,
          window.innerHeight * 0.35,
          window.innerHeight * 0.45,
          window.innerHeight * 0.35,
          window.innerHeight * 0.15,
          -50,
        ],
        rotate: [0, 5, 10, 0, -10, -5, 0],
      }}
      transition={{
        duration: 4,
        ease: 'easeInOut',
        times: [0, 0.15, 0.3, 0.5, 0.7, 0.85, 1],
      }}
      onAnimationComplete={() => {
        // Remove from DOM after animation completes
        setTimeout(() => setShouldAnimate(false), 100);
      }}
    >
      {/* Graduation Cap SVG */}
      <svg
        width="70"
        height="70"
        viewBox="0 0 24 24"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        className="drop-shadow-lg"
      >
        {/* Cap base (square board) */}
        <path
          d="M2 10L12 6L22 10L12 14L2 10Z"
          fill="#3B82F6"
          stroke="#1E40AF"
          strokeWidth="1.2"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
        {/* Cap top (small square on top) */}
        <rect
          x="11"
          y="4"
          width="2"
          height="2"
          fill="#1E40AF"
          rx="0.5"
        />
        {/* Right side of cap */}
        <path
          d="M22 10V13C22 14 18 16 12 16C6 16 2 14 2 13V10"
          stroke="#1E40AF"
          strokeWidth="1.2"
          strokeLinecap="round"
          strokeLinejoin="round"
          fill="none"
        />
        {/* Tassel */}
        <motion.g
          initial={{ rotate: 0 }}
          animate={{ rotate: [-5, 5, -5, 5, 0] }}
          transition={{ duration: 4, times: [0, 0.25, 0.5, 0.75, 1] }}
          style={{ transformOrigin: '22px 10px' }}
        >
          <line
            x1="22"
            y1="10"
            x2="23.5"
            y2="13"
            stroke="#FBBF24"
            strokeWidth="1.5"
            strokeLinecap="round"
          />
          <circle
            cx="23.5"
            cy="13.5"
            r="1"
            fill="#FBBF24"
          />
        </motion.g>
        {/* Add sparkles for celebration effect */}
        <motion.g
          initial={{ opacity: 0, scale: 0 }}
          animate={{ 
            opacity: [0, 1, 1, 0],
            scale: [0, 1.2, 1, 0.8],
          }}
          transition={{ duration: 4, times: [0, 0.2, 0.6, 1] }}
        >
          <circle cx="8" cy="8" r="1" fill="#FBBF24" />
          <circle cx="16" cy="7" r="0.8" fill="#60A5FA" />
          <circle cx="6" cy="12" r="0.7" fill="#FBBF24" />
        </motion.g>
      </svg>
      
      {/* Trail effect */}
      <motion.div
        className="absolute top-1/2 left-0 -translate-y-1/2"
        initial={{ opacity: 0, scaleX: 0 }}
        animate={{ 
          opacity: [0, 0.4, 0.4, 0],
          scaleX: [0, 1, 1, 0.5],
        }}
        transition={{ duration: 4, times: [0, 0.2, 0.8, 1] }}
      >
        <div className="w-20 h-1 bg-gradient-to-l from-blue-400/40 via-amber-400/30 to-transparent blur-sm" />
      </motion.div>
    </motion.div>
  );
}
