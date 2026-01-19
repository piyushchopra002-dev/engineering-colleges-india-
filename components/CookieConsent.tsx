"use client";

import { useState, useEffect } from "react";
import Cookies from "js-cookie";
import { X, Settings } from "lucide-react";
import { useConsent } from "@/app/providers";

export function CookieConsent() {
  const { consentGiven, setConsentGiven } = useConsent();
  const [showCustomize, setShowCustomize] = useState(false);
  const [analytics, setAnalytics] = useState(true);

  useEffect(() => {
    const consent = Cookies.get("cookie-consent");
    if (!consent) {
      setConsentGiven(false);
    }
  }, [setConsentGiven]);

  useEffect(() => {
    if (consentGiven) return;
    const previousOverflow = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => {
      document.body.style.overflow = previousOverflow;
    };
  }, [consentGiven]);

  const handleAccept = () => {
    Cookies.set("cookie-consent", "accepted", { expires: 365 });
    setConsentGiven(true);
  };

  const handleDecline = () => {
    Cookies.set("cookie-consent", "declined", { expires: 365 });
    setConsentGiven(true);
  };

  const handleSavePreferences = () => {
    if (analytics) {
      Cookies.set("cookie-consent", "accepted", { expires: 365 });
    } else {
      Cookies.set("cookie-consent", "declined", { expires: 365 });
    }
    setConsentGiven(true);
    setShowCustomize(false);
  };

  if (consentGiven) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm p-4 animate-overlay-in">
      <div
        className={`w-full max-w-3xl rounded-2xl border border-white/10 bg-slate-950/90 p-6 shadow-2xl ${
          showCustomize ? "animate-modal-in-preferences" : "animate-modal-in-main"
        }`}
      >
        {!showCustomize ? (
          <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-6">
            <div className="flex-1">
              <h3 className="text-lg font-semibold text-white mb-2">
                Cookie Consent
              </h3>
              <p className="text-sm text-slate-300">
                We use cookies to enhance your browsing experience, analyze site
                traffic, and personalize content. By clicking "Accept All", you
                consent to our use of cookies.{" "}
                <a
                  href="/cookies"
                  className="text-primary-300 hover:underline"
                >
                  Learn more
                </a>
              </p>
            </div>
            <div className="flex items-center gap-3">
              <button
                onClick={() => setShowCustomize(true)}
                className="px-4 py-2 text-sm font-medium text-slate-200 bg-white/10 border border-white/10 rounded-lg hover:bg-white/20"
              >
                <Settings className="h-4 w-4 inline mr-2" />
                Customize
              </button>
              <button
                onClick={handleDecline}
                className="px-4 py-2 text-sm font-medium text-slate-200 bg-white/10 border border-white/10 rounded-lg hover:bg-white/20"
              >
                Decline
              </button>
              <button
                onClick={handleAccept}
                className="px-4 py-2 text-sm font-medium text-white bg-gradient-to-r from-primary-500 via-fuchsia-500 to-pink-500 rounded-lg hover:from-primary-400 hover:to-pink-400 transition-all"
              >
                Accept All
              </button>
            </div>
          </div>
        ) : (
          <div>
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-semibold text-white">
                Cookie Preferences
              </h3>
              <button
                onClick={() => setShowCustomize(false)}
                className="text-slate-300 hover:text-white"
              >
                <X className="h-5 w-5" />
              </button>
            </div>
            <div className="space-y-4 mb-4">
              <div className="flex items-center justify-between p-4 bg-white/5 border border-white/10 rounded-lg">
                <div>
                  <h4 className="font-medium text-white">Analytics Cookies</h4>
                  <p className="text-sm text-slate-300">
                    Help us understand how visitors interact with our website
                  </p>
                </div>
                <label className="relative inline-flex items-center cursor-pointer">
                  <input
                    type="checkbox"
                    checked={analytics}
                    onChange={(e) => setAnalytics(e.target.checked)}
                    className="sr-only peer"
                  />
                  <div className="w-11 h-6 bg-white/20 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-primary-300 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-white/30 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary-600"></div>
                </label>
              </div>
            </div>
            <div className="flex justify-end gap-3">
              <button
                onClick={() => setShowCustomize(false)}
                className="px-4 py-2 text-sm font-medium text-slate-200 bg-white/10 border border-white/10 rounded-lg hover:bg-white/20"
              >
                Cancel
              </button>
              <button
                onClick={handleSavePreferences}
                className="px-4 py-2 text-sm font-medium text-white bg-gradient-to-r from-primary-500 via-fuchsia-500 to-pink-500 rounded-lg hover:from-primary-400 hover:to-pink-400 transition-all"
              >
                Save Preferences
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
