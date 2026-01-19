"use client";

export function FloatingDecorations() {
  return (
    <div className="absolute inset-0 pointer-events-none overflow-hidden">
      {/* Notebooks */}
      <div className="absolute top-20 left-10 animate-float opacity-20" style={{ animationDuration: "15s" }}>
        <svg width="60" height="80" viewBox="0 0 60 80" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="10" y="10" width="40" height="60" rx="2" fill="url(#notebook1)" />
          <line x1="15" y1="25" x2="45" y2="25" stroke="white" strokeWidth="1" opacity="0.5" />
          <line x1="15" y1="35" x2="45" y2="35" stroke="white" strokeWidth="1" opacity="0.5" />
          <line x1="15" y1="45" x2="45" y2="45" stroke="white" strokeWidth="1" opacity="0.5" />
          <line x1="15" y1="55" x2="45" y2="55" stroke="white" strokeWidth="1" opacity="0.5" />
          <rect x="8" y="10" width="4" height="60" fill="#ff6b9d" opacity="0.8" />
          <defs>
            <linearGradient id="notebook1" x1="30" y1="10" x2="30" y2="70">
              <stop stopColor="#a78bfa" />
              <stop offset="1" stopColor="#7c3aed" />
            </linearGradient>
          </defs>
        </svg>
      </div>

      <div className="absolute top-40 right-20 animate-float opacity-20" style={{ animationDelay: "2s", animationDuration: "18s" }}>
        <svg width="50" height="70" viewBox="0 0 50 70" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="8" y="8" width="34" height="54" rx="2" fill="url(#notebook2)" />
          <line x1="12" y1="20" x2="38" y2="20" stroke="white" strokeWidth="0.8" opacity="0.4" />
          <line x1="12" y1="28" x2="38" y2="28" stroke="white" strokeWidth="0.8" opacity="0.4" />
          <line x1="12" y1="36" x2="38" y2="36" stroke="white" strokeWidth="0.8" opacity="0.4" />
          <rect x="6" y="8" width="3" height="54" fill="#fbbf24" opacity="0.8" />
          <defs>
            <linearGradient id="notebook2" x1="25" y1="8" x2="25" y2="62">
              <stop stopColor="#60a5fa" />
              <stop offset="1" stopColor="#3b82f6" />
            </linearGradient>
          </defs>
        </svg>
      </div>

      {/* Pens */}
      <div className="absolute top-60 left-1/4 animate-float opacity-25" style={{ animationDelay: "4s", animationDuration: "12s" }}>
        <svg width="80" height="20" viewBox="0 0 80 20" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="0" y="7" width="65" height="6" rx="3" fill="url(#pen1)" />
          <polygon points="65,7 65,13 75,10" fill="#fbbf24" />
          <rect x="5" y="8" width="50" height="4" fill="white" opacity="0.3" />
          <defs>
            <linearGradient id="pen1" x1="0" y1="10" x2="65" y2="10">
              <stop stopColor="#ec4899" />
              <stop offset="1" stopColor="#db2777" />
            </linearGradient>
          </defs>
        </svg>
      </div>

      <div className="absolute bottom-40 right-1/3 animate-float opacity-25" style={{ animationDelay: "6s", animationDuration: "14s", transform: "rotate(-25deg)" }}>
        <svg width="70" height="18" viewBox="0 0 70 18" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="0" y="6" width="55" height="6" rx="3" fill="url(#pen2)" />
          <polygon points="55,6 55,12 65,9" fill="#a78bfa" />
          <defs>
            <linearGradient id="pen2" x1="0" y1="9" x2="55" y2="9">
              <stop stopColor="#10b981" />
              <stop offset="1" stopColor="#059669" />
            </linearGradient>
          </defs>
        </svg>
      </div>

      {/* Flowers */}
      <div className="absolute top-1/3 right-10 animate-float opacity-30" style={{ animationDelay: "1s", animationDuration: "20s" }}>
        <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
          {/* Petals */}
          <ellipse cx="25" cy="15" rx="8" ry="12" fill="#f472b6" opacity="0.8" />
          <ellipse cx="35" cy="25" rx="12" ry="8" fill="#f472b6" opacity="0.8" />
          <ellipse cx="25" cy="35" rx="8" ry="12" fill="#f472b6" opacity="0.8" />
          <ellipse cx="15" cy="25" rx="12" ry="8" fill="#f472b6" opacity="0.8" />
          {/* Center */}
          <circle cx="25" cy="25" r="6" fill="#fbbf24" />
          <circle cx="25" cy="25" r="3" fill="#f59e0b" />
        </svg>
      </div>

      <div className="absolute bottom-1/4 left-1/3 animate-float opacity-30" style={{ animationDelay: "3s", animationDuration: "16s" }}>
        <svg width="45" height="45" viewBox="0 0 45 45" fill="none" xmlns="http://www.w3.org/2000/svg">
          <ellipse cx="22.5" cy="12" rx="7" ry="10" fill="#a78bfa" opacity="0.8" />
          <ellipse cx="33" cy="22.5" rx="10" ry="7" fill="#a78bfa" opacity="0.8" />
          <ellipse cx="22.5" cy="33" rx="7" ry="10" fill="#a78bfa" opacity="0.8" />
          <ellipse cx="12" cy="22.5" rx="10" ry="7" fill="#a78bfa" opacity="0.8" />
          <circle cx="22.5" cy="22.5" r="5" fill="#fde68a" />
        </svg>
      </div>

      <div className="absolute top-1/2 left-20 animate-float opacity-25" style={{ animationDelay: "5s", animationDuration: "18s" }}>
        <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
          <ellipse cx="20" cy="10" rx="6" ry="9" fill="#60a5fa" opacity="0.8" />
          <ellipse cx="30" cy="20" rx="9" ry="6" fill="#60a5fa" opacity="0.8" />
          <ellipse cx="20" cy="30" rx="6" ry="9" fill="#60a5fa" opacity="0.8" />
          <ellipse cx="10" cy="20" rx="9" ry="6" fill="#60a5fa" opacity="0.8" />
          <circle cx="20" cy="20" r="4" fill="#fcd34d" />
        </svg>
      </div>

      {/* Water Bubbles */}
      {[...Array(15)].map((_, i) => (
        <div
          key={`bubble-${i}`}
          className="absolute animate-float opacity-10"
          style={{
            left: `${10 + (i * 6)}%`,
            top: `${20 + (i * 5) % 60}%`,
            animationDelay: `${i * 0.8}s`,
            animationDuration: `${8 + (i % 4) * 2}s`,
          }}
        >
          <svg width={20 + (i % 3) * 10} height={20 + (i % 3) * 10} viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
            <circle cx="15" cy="15" r="14" fill="url(#bubble)" stroke="white" strokeWidth="0.5" opacity="0.6" />
            <circle cx="18" cy="12" r="3" fill="white" opacity="0.4" />
            <defs>
              <radialGradient id="bubble">
                <stop offset="0%" stopColor="#e0f2fe" />
                <stop offset="100%" stopColor="#7dd3fc" stopOpacity="0.2" />
              </radialGradient>
            </defs>
          </svg>
        </div>
      ))}

      {/* Pencils */}
      <div className="absolute top-80 right-1/4 animate-float opacity-20" style={{ animationDelay: "7s", animationDuration: "13s", transform: "rotate(45deg)" }}>
        <svg width="100" height="24" viewBox="0 0 100 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="0" y="8" width="85" height="8" fill="#fbbf24" />
          <polygon points="85,8 85,16 95,12" fill="#d97706" />
          <rect x="0" y="9" width="3" height="6" fill="#ef4444" />
          <rect x="5" y="10" width="75" height="4" fill="#fde68a" opacity="0.5" />
        </svg>
      </div>

      {/* Books Stack */}
      <div className="absolute bottom-20 left-1/4 animate-float opacity-25" style={{ animationDelay: "2s", animationDuration: "16s" }}>
        <svg width="60" height="50" viewBox="0 0 60 50" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="5" y="30" width="50" height="12" rx="1" fill="#ef4444" opacity="0.8" />
          <rect x="8" y="20" width="48" height="12" rx="1" fill="#3b82f6" opacity="0.8" />
          <rect x="10" y="10" width="45" height="12" rx="1" fill="#10b981" opacity="0.8" />
        </svg>
      </div>

      {/* Stars/Sparkles */}
      {[...Array(20)].map((_, i) => (
        <div
          key={`star-${i}`}
          className="absolute animate-pulse"
          style={{
            left: `${5 + (i * 4.5) % 90}%`,
            top: `${10 + (i * 3.7) % 80}%`,
            animationDelay: `${i * 0.3}s`,
            animationDuration: `${2 + (i % 3)}s`,
            opacity: 0.15,
          }}
        >
          <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M8 0L9.5 6.5L16 8L9.5 9.5L8 16L6.5 9.5L0 8L6.5 6.5L8 0Z"
              fill="#fbbf24"
            />
          </svg>
        </div>
      ))}

      {/* Calculator */}
      <div className="absolute top-1/4 left-1/2 animate-float opacity-20" style={{ animationDelay: "8s", animationDuration: "17s" }}>
        <svg width="40" height="60" viewBox="0 0 40 60" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="5" y="5" width="30" height="50" rx="3" fill="#1f2937" />
          <rect x="8" y="8" width="24" height="10" rx="1" fill="#4ade80" />
          <rect x="8" y="22" width="7" height="7" rx="1" fill="#6b7280" />
          <rect x="17" y="22" width="7" height="7" rx="1" fill="#6b7280" />
          <rect x="26" y="22" width="6" height="7" rx="1" fill="#6b7280" />
          <rect x="8" y="31" width="7" height="7" rx="1" fill="#6b7280" />
          <rect x="17" y="31" width="7" height="7" rx="1" fill="#6b7280" />
          <rect x="26" y="31" width="6" height="7" rx="1" fill="#6b7280" />
        </svg>
      </div>

      {/* Ruler */}
      <div className="absolute bottom-1/3 right-20 animate-float opacity-20" style={{ animationDelay: "4s", animationDuration: "15s", transform: "rotate(-15deg)" }}>
        <svg width="120" height="20" viewBox="0 0 120 20" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="0" y="5" width="120" height="10" rx="1" fill="#fbbf24" opacity="0.8" />
          {[...Array(12)].map((_, i) => (
            <line key={i} x1={10 * i} y1="5" x2={10 * i} y2={i % 2 === 0 ? "10" : "12"} stroke="#d97706" strokeWidth="1" />
          ))}
        </svg>
      </div>

      {/* Coffee Cup */}
      <div className="absolute top-1/2 right-1/4 animate-float opacity-25" style={{ animationDelay: "6s", animationDuration: "14s" }}>
        <svg width="40" height="50" viewBox="0 0 40 50" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M8 15 L10 40 L30 40 L32 15 Z" fill="#7c3aed" opacity="0.8" />
          <ellipse cx="20" cy="15" rx="12" ry="4" fill="#6d28d9" />
          <path d="M32 20 Q38 20 38 25 Q38 30 32 30" stroke="#7c3aed" strokeWidth="2" fill="none" />
          <path d="M15 5 Q17 8 15 10" stroke="#e0e7ff" strokeWidth="1.5" strokeLinecap="round" fill="none" opacity="0.6" />
          <path d="M20 5 Q22 8 20 10" stroke="#e0e7ff" strokeWidth="1.5" strokeLinecap="round" fill="none" opacity="0.6" />
          <path d="M25 5 Q27 8 25 10" stroke="#e0e7ff" strokeWidth="1.5" strokeLinecap="round" fill="none" opacity="0.6" />
        </svg>
      </div>

      {/* Graduation Cap */}
      <div className="absolute bottom-40 left-10 animate-float opacity-20" style={{ animationDelay: "5s", animationDuration: "19s" }}>
        <svg width="60" height="40" viewBox="0 0 60 40" fill="none" xmlns="http://www.w3.org/2000/svg">
          <polygon points="30,5 5,15 30,25 55,15" fill="#3b82f6" />
          <polygon points="30,25 25,27 25,35 30,37 35,35 35,27" fill="#2563eb" />
          <rect x="52" y="15" width="3" height="15" fill="#1e40af" />
          <circle cx="53.5" cy="32" r="2" fill="#fbbf24" />
        </svg>
      </div>
    </div>
  );
}
