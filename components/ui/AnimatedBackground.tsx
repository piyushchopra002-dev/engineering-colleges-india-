"use client";

export function AnimatedBackground() {
  return (
    <div className="fixed inset-0 pointer-events-none overflow-hidden z-0">
      {/* Large Floating Orbs */}
      <div className="absolute top-20 left-10 w-96 h-96 bg-primary-500/10 rounded-full blur-3xl animate-float animate-morph" style={{ animationDuration: "20s" }}></div>
      <div className="absolute top-40 right-20 w-80 h-80 bg-fuchsia-500/10 rounded-full blur-3xl animate-float" style={{ animationDelay: "5s", animationDuration: "25s" }}></div>
      <div className="absolute bottom-32 left-1/4 w-72 h-72 bg-blue-500/10 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "10s", animationDuration: "18s" }}></div>
      <div className="absolute bottom-20 right-1/3 w-64 h-64 bg-purple-500/10 rounded-full blur-3xl animate-float" style={{ animationDelay: "3s", animationDuration: "22s" }}></div>
      <div className="absolute top-1/2 left-1/2 w-56 h-56 bg-pink-500/10 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "7s", animationDuration: "16s" }}></div>
      
      {/* Small Sparkle Dots */}
      <div className="absolute top-1/4 left-1/3 w-2 h-2 bg-primary-400 rounded-full opacity-60 animate-pulse"></div>
      <div className="absolute top-2/3 right-1/4 w-2 h-2 bg-fuchsia-400 rounded-full opacity-60 animate-pulse" style={{ animationDelay: "1s" }}></div>
      <div className="absolute bottom-1/3 left-2/3 w-2 h-2 bg-blue-400 rounded-full opacity-60 animate-pulse" style={{ animationDelay: "2s" }}></div>
      <div className="absolute top-1/2 right-1/2 w-2 h-2 bg-purple-400 rounded-full opacity-60 animate-pulse" style={{ animationDelay: "3s" }}></div>
      <div className="absolute top-3/4 left-1/4 w-2 h-2 bg-pink-400 rounded-full opacity-60 animate-pulse" style={{ animationDelay: "1.5s" }}></div>
      
      {/* Gradient Lines */}
      <div className="absolute top-0 left-1/4 w-px h-full bg-gradient-to-b from-transparent via-primary-500/10 to-transparent animate-pulse" style={{ animationDuration: "3s" }}></div>
      <div className="absolute top-0 right-1/3 w-px h-full bg-gradient-to-b from-transparent via-fuchsia-500/10 to-transparent animate-pulse" style={{ animationDelay: "1.5s", animationDuration: "3s" }}></div>
    </div>
  );
}

export function PageAnimatedBackground({ variant = "default" }: { variant?: "default" | "dark" | "light" }) {
  const colorSchemes = {
    default: {
      orb1: "bg-primary-500/10",
      orb2: "bg-fuchsia-500/10",
      orb3: "bg-blue-500/10",
    },
    dark: {
      orb1: "bg-primary-500/20",
      orb2: "bg-fuchsia-500/15",
      orb3: "bg-blue-500/15",
    },
    light: {
      orb1: "bg-primary-500/5",
      orb2: "bg-fuchsia-500/5",
      orb3: "bg-blue-500/5",
    },
  };

  const colors = colorSchemes[variant];

  return (
    <div className="absolute inset-0 pointer-events-none overflow-hidden">
      <div className={`absolute top-10 right-10 w-96 h-96 ${colors.orb1} rounded-full blur-3xl animate-float animate-morph`} style={{ animationDuration: "20s" }}></div>
      <div className={`absolute bottom-10 left-10 w-80 h-80 ${colors.orb2} rounded-full blur-3xl animate-float`} style={{ animationDelay: "5s", animationDuration: "18s" }}></div>
      <div className={`absolute top-1/2 left-1/2 w-72 h-72 ${colors.orb3} rounded-full blur-3xl animate-float animate-morph`} style={{ animationDelay: "10s", animationDuration: "22s" }}></div>
    </div>
  );
}
