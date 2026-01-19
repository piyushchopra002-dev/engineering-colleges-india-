import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: "#fdf2ff",
          100: "#fae8ff",
          200: "#f5d0fe",
          300: "#f0abfc",
          400: "#e879f9",
          500: "#d946ef",
          600: "#c026d3",
          700: "#a21caf",
          800: "#86198f",
          900: "#701a75",
        },
      },
      animation: {
        "fade-in": "fadeIn 0.5s ease-in-out",
        "slide-up": "slideUp 0.5s ease-out",
        "overlay-in": "overlayIn 260ms ease-out",
        "modal-in-main": "modalInMain 420ms cubic-bezier(0.16, 1, 0.3, 1)",
        "modal-in-preferences": "modalInPreferences 520ms cubic-bezier(0.16, 1, 0.3, 1)",
      },
      keyframes: {
        fadeIn: {
          "0%": { opacity: "0" },
          "100%": { opacity: "1" },
        },
        slideUp: {
          "0%": { transform: "translateY(20px)", opacity: "0" },
          "100%": { transform: "translateY(0)", opacity: "1" },
        },
        overlayIn: {
          "0%": { opacity: "0" },
          "100%": { opacity: "1" },
        },
        modalInMain: {
          "0%": { opacity: "0", transform: "translateY(30px) scale(0.92)", filter: "blur(6px)" },
          "60%": { opacity: "1", transform: "translateY(-4px) scale(1.02)", filter: "blur(0)" },
          "100%": { opacity: "1", transform: "translateY(0) scale(1)", filter: "blur(0)" },
        },
        modalInPreferences: {
          "0%": { opacity: "0", transform: "translateX(28px) scale(0.9)", filter: "blur(6px)" },
          "65%": { opacity: "1", transform: "translateX(-6px) scale(1.01)", filter: "blur(0)" },
          "100%": { opacity: "1", transform: "translateX(0) scale(1)", filter: "blur(0)" },
        },
      },
    },
  },
  plugins: [],
};
export default config;
