"use client";

import { useState, useEffect } from "react";
import { X, Bell, Gift, Sparkles, TrendingUp, Award, Users, Check } from "lucide-react";
import Link from "next/link";

// Welcome Popup
export function WelcomePopup() {
  const [show, setShow] = useState(false);
  const [hasShown, setHasShown] = useState(false);

  useEffect(() => {
    const shown = localStorage.getItem("welcomeShown");
    if (!shown) {
      setTimeout(() => setShow(true), 2000);
    }
  }, []);

  const handleClose = () => {
    setShow(false);
    localStorage.setItem("welcomeShown", "true");
  };

  if (!show) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 animate-fade-in-up">
      <div className="absolute inset-0 bg-black/60 backdrop-blur-sm" onClick={handleClose}></div>
      <div className="relative bg-gradient-to-br from-primary-600 to-fuchsia-600 rounded-2xl p-8 max-w-md w-full shadow-2xl animate-scale-in border-2 border-white/20">
        <button
          onClick={handleClose}
          className="absolute top-4 right-4 text-white/80 hover:text-white transition-colors"
        >
          <X className="h-6 w-6" />
        </button>
        
        <div className="text-center">
          <div className="w-20 h-20 bg-white/20 rounded-full flex items-center justify-center mx-auto mb-4 animate-pulse">
            <Sparkles className="h-10 w-10 text-white" />
          </div>
          <h2 className="text-3xl font-bold text-white mb-3">Welcome! 🎓</h2>
          <p className="text-white/90 mb-6">
            Find your perfect engineering college from over 500+ verified institutions across India
          </p>
          <div className="space-y-3 mb-6">
            <div className="flex items-center gap-3 text-white/90">
              <Check className="h-5 w-5 text-green-300" />
              <span>100% Verified Data</span>
            </div>
            <div className="flex items-center gap-3 text-white/90">
              <Check className="h-5 w-5 text-green-300" />
              <span>Real-time Rankings</span>
            </div>
            <div className="flex items-center gap-3 text-white/90">
              <Check className="h-5 w-5 text-green-300" />
              <span>Smart Compare Tool</span>
            </div>
          </div>
          <button
            onClick={handleClose}
            className="w-full bg-white text-primary-600 font-bold py-3 px-6 rounded-lg hover:bg-gray-100 transition-all transform hover:scale-105"
          >
            Let's Explore!
          </button>
        </div>
      </div>
    </div>
  );
}

// Notification Toasts
export function NotificationToasts() {
  const [notifications, setNotifications] = useState<Array<{
    id: number;
    message: string;
    type: string;
  }>>([]);

  useEffect(() => {
    const messages = [
      { message: "🎉 New college added: MIT Chennai", type: "success" },
      { message: "📊 Rankings updated for 2024", type: "info" },
      { message: "🔥 50+ users comparing colleges now", type: "trending" },
      { message: "⭐ 10,000+ students helped this month", type: "success" },
    ];

    const showNotification = (index: number) => {
      if (index < messages.length) {
        const id = Date.now();
        setNotifications((prev) => [...prev, { id, ...messages[index] }]);
        setTimeout(() => {
          setNotifications((prev) => prev.filter((n) => n.id !== id));
          setTimeout(() => showNotification(index + 1), 5000);
        }, 4000);
      }
    };

    setTimeout(() => showNotification(0), 5000);
  }, []);

  return (
    <div className="fixed bottom-24 right-4 z-40 space-y-2">
      {notifications.map((notif) => (
        <div
          key={notif.id}
          className="bg-gradient-to-r from-slate-900 to-slate-800 border border-white/20 rounded-lg p-4 shadow-2xl backdrop-blur max-w-sm animate-slide-in-right"
        >
          <div className="flex items-center gap-3">
            <div className="w-2 h-2 rounded-full bg-green-400 animate-pulse"></div>
            <p className="text-white text-sm font-medium">{notif.message}</p>
          </div>
        </div>
      ))}
    </div>
  );
}

// Floating Action Button with Menu
export function FloatingActionButton() {
  const [isOpen, setIsOpen] = useState(false);

  const actions = [
    { icon: TrendingUp, label: "Compare", href: "/compare", color: "bg-blue-500" },
    { icon: Award, label: "Rankings", href: "/colleges", color: "bg-purple-500" },
    { icon: Users, label: "About", href: "#", color: "bg-green-500" },
  ];

  return (
    <div className="fixed bottom-6 right-6 z-50">
      {isOpen && (
        <div className="absolute bottom-16 right-0 space-y-3 mb-2">
          {actions.map((action, index) => (
            <Link
              key={index}
              href={action.href}
              className={`flex items-center gap-3 ${action.color} text-white px-4 py-3 rounded-full shadow-lg hover:scale-110 transition-all animate-fade-in-up`}
              style={{ animationDelay: `${index * 0.1}s` }}
            >
              <action.icon className="h-5 w-5" />
              <span className="font-medium">{action.label}</span>
            </Link>
          ))}
        </div>
      )}
      <button
        onClick={() => setIsOpen(!isOpen)}
        className={`w-14 h-14 rounded-full bg-gradient-to-r from-primary-500 to-fuchsia-500 text-white shadow-2xl hover:scale-110 transition-all flex items-center justify-center ${
          isOpen ? "rotate-45" : ""
        }`}
      >
        <Sparkles className="h-6 w-6" />
      </button>
    </div>
  );
}

// Interactive Stats Popup
export function InteractiveStatsPopup() {
  const [show, setShow] = useState(false);

  useEffect(() => {
    const timer = setTimeout(() => setShow(true), 15000);
    return () => clearTimeout(timer);
  }, []);

  if (!show) return null;

  return (
    <div className="fixed top-24 right-4 z-40 animate-slide-in-right">
      <div className="bg-gradient-to-br from-orange-500 to-red-500 rounded-xl p-6 shadow-2xl max-w-xs border-2 border-white/20 relative">
        <button
          onClick={() => setShow(false)}
          className="absolute top-2 right-2 text-white/80 hover:text-white"
        >
          <X className="h-4 w-4" />
        </button>
        <div className="flex items-center gap-3 mb-3">
          <div className="w-12 h-12 bg-white/20 rounded-full flex items-center justify-center animate-pulse">
            <TrendingUp className="h-6 w-6 text-white" />
          </div>
          <div>
            <div className="text-2xl font-bold text-white">250+</div>
            <div className="text-white/90 text-sm">Active Users Now</div>
          </div>
        </div>
        <p className="text-white/90 text-sm">
          Join thousands finding their dream college!
        </p>
      </div>
    </div>
  );
}

// Limited Time Offer Banner
export function LimitedOfferBanner() {
  const [show, setShow] = useState(false);

  useEffect(() => {
    const shown = sessionStorage.getItem("offerShown");
    if (!shown) {
      setTimeout(() => {
        setShow(true);
        sessionStorage.setItem("offerShown", "true");
      }, 10000);
    }
  }, []);

  if (!show) return null;

  return (
    <div className="fixed top-20 left-1/2 transform -translate-x-1/2 z-40 animate-slide-in-down">
      <div className="bg-gradient-to-r from-green-500 to-emerald-500 rounded-full px-6 py-3 shadow-2xl flex items-center gap-3 border-2 border-white/30">
        <Gift className="h-5 w-5 text-white animate-bounce" />
        <span className="text-white font-semibold">
          🎁 Premium Features Now Free! Limited Time
        </span>
        <button
          onClick={() => setShow(false)}
          className="text-white/80 hover:text-white ml-2"
        >
          <X className="h-4 w-4" />
        </button>
      </div>
    </div>
  );
}

// Scroll Progress Bar
export function ScrollProgressBar() {
  const [progress, setProgress] = useState(0);

  useEffect(() => {
    const handleScroll = () => {
      const totalHeight = document.documentElement.scrollHeight - window.innerHeight;
      const scrolled = (window.scrollY / totalHeight) * 100;
      setProgress(scrolled);
    };

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  return (
    <div className="fixed top-0 left-0 w-full h-1 bg-transparent z-50">
      <div
        className="h-full bg-gradient-to-r from-primary-500 via-fuchsia-500 to-pink-500 transition-all duration-300"
        style={{ width: `${progress}%` }}
      ></div>
    </div>
  );
}
