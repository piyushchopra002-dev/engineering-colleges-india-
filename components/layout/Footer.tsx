import Link from "next/link";
import { GraduationCap, Heart, Github, Linkedin } from "lucide-react";

export function Footer() {
  const currentYear = new Date().getFullYear();

  return (
    <footer className="relative bg-gradient-to-b from-gray-900 via-gray-900 to-black text-gray-300 border-t border-white/10 overflow-hidden">
      <div className="absolute inset-0 bg-gradient-to-r from-primary-900/5 to-fuchsia-900/5 animate-gradient"></div>
      
      {/* Subtle Animated Orbs */}
      <div className="absolute inset-0 pointer-events-none">
        <div className="absolute top-10 right-1/4 w-64 h-64 bg-primary-500/5 rounded-full blur-3xl animate-float" style={{ animationDuration: "20s" }}></div>
        <div className="absolute bottom-10 left-1/4 w-72 h-72 bg-fuchsia-500/5 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "8s", animationDuration: "24s" }}></div>
      </div>
      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div className="md:col-span-1">
            <Link href="/" className="flex items-center space-x-2 mb-4 group">
              <div className="p-2 bg-gradient-to-br from-primary-500 to-fuchsia-500 rounded-lg group-hover:scale-110 transition-transform">
                <GraduationCap className="h-5 w-5 text-white" />
              </div>
              <span className="text-lg font-bold text-white group-hover:text-primary-300 transition-colors">
                Best Engineering Colleges
              </span>
            </Link>
            <p className="text-sm text-gray-400 mb-4">
              Your comprehensive guide to engineering colleges in India. Compare
              rankings, placements, cutoffs, and more.
            </p>
            <div className="flex gap-3">
              <a 
                href="https://www.linkedin.com/in/piyush-chopra-44a093371" 
                target="_blank" 
                rel="noopener noreferrer"
                className="p-2 bg-white/5 hover:bg-primary-500/20 rounded-lg transition-all hover:scale-110 cursor-pointer"
                title="Connect on LinkedIn"
                aria-label="Connect on LinkedIn"
              >
                <Linkedin className="h-5 w-5" />
              </a>
              <a 
                href="https://github.com/piyushchopra002-dev" 
                target="_blank" 
                rel="noopener noreferrer"
                className="p-2 bg-white/5 hover:bg-primary-500/20 rounded-lg transition-all hover:scale-110 cursor-pointer"
                title="View on GitHub"
                aria-label="View on GitHub"
              >
                <Github className="h-5 w-5" />
              </a>
            </div>
          </div>

          <div>
            <h3 className="text-white font-semibold mb-4 text-sm uppercase tracking-wider">Explore</h3>
            <ul className="space-y-2.5 text-sm">
              <li>
                <Link href="/colleges" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  All Colleges
                </Link>
              </li>
              <li>
                <Link href="/compare" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  Compare Colleges
                </Link>
              </li>
              <li>
                <Link href="/rankings" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  Rankings
                </Link>
              </li>
              <li>
                <Link href="/cities" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  Cities
                </Link>
              </li>
            </ul>
          </div>

          <div>
            <h3 className="text-white font-semibold mb-4 text-sm uppercase tracking-wider">Resources</h3>
            <ul className="space-y-2.5 text-sm">
              <li>
                <Link href="/chat" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  AI Counselor
                </Link>
              </li>
              <li>
                <Link href="/placements" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  Placements
                </Link>
              </li>
              <li>
                <Link href="/cutoffs" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  Cutoffs
                </Link>
              </li>
              <li>
                <Link href="/events" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  Events
                </Link>
              </li>
            </ul>
          </div>

          <div>
            <h3 className="text-white font-semibold mb-4 text-sm uppercase tracking-wider">Legal</h3>
            <ul className="space-y-2.5 text-sm">
              <li>
                <Link href="/privacy" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  Privacy Policy
                </Link>
              </li>
              <li>
                <Link href="/cookies" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  Cookie Policy
                </Link>
              </li>
              <li>
                <Link href="/terms" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  Terms of Service
                </Link>
              </li>
              <li>
                <Link href="/contact" className="text-gray-400 hover:text-primary-300 transition-colors hover:translate-x-1 inline-block">
                  Contact Us
                </Link>
              </li>
            </ul>
          </div>
        </div>

        <div className="mt-12 pt-8 border-t border-white/10 text-center text-sm">
          <p className="text-gray-400 flex items-center justify-center gap-2">
            © {currentYear} Best Engineering Colleges in India. Made with{" "}
            <Heart className="h-4 w-4 text-red-500 inline animate-pulse" /> for students
          </p>
        </div>
      </div>
    </footer>
  );
}
