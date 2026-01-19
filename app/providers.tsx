"use client";

import { createContext, useContext, useState, useEffect } from "react";
import Cookies from "js-cookie";

interface ConsentContextType {
  consentGiven: boolean;
  setConsentGiven: (value: boolean) => void;
  analyticsEnabled: boolean;
}

const ConsentContext = createContext<ConsentContextType | undefined>(undefined);

export function useConsent() {
  const context = useContext(ConsentContext);
  if (!context) {
    throw new Error("useConsent must be used within Providers");
  }
  return context;
}

export function Providers({ children }: { children: React.ReactNode }) {
  const [consentGiven, setConsentGivenState] = useState(false);
  const [analyticsEnabled, setAnalyticsEnabled] = useState(false);

  useEffect(() => {
    const consent = Cookies.get("cookie-consent");
    if (consent === "accepted") {
      setConsentGivenState(true);
      setAnalyticsEnabled(true);
      // Initialize analytics here if needed
    } else if (consent === "declined") {
      setConsentGivenState(true);
      setAnalyticsEnabled(false);
    }
  }, []);

  const setConsentGiven = (value: boolean) => {
    setConsentGivenState(value);
    if (value) {
      const consent = Cookies.get("cookie-consent");
      setAnalyticsEnabled(consent === "accepted");
    }
  };

  return (
    <ConsentContext.Provider value={{ consentGiven, setConsentGiven, analyticsEnabled }}>
      {children}
    </ConsentContext.Provider>
  );
}
