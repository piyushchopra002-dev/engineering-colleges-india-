"use client";

import Link from "next/link";
import { useState } from "react";
import { Menu, X, Search, GraduationCap } from "lucide-react";
import { cn } from "@/lib/utils";

export function Navigation() {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <nav className="sticky top-0 z-50 bg-transparent">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mt-4 rounded-full bg-white/90 backdrop-blur border border-white/60 shadow-xl shadow-black/20 px-4">
          <div className="flex justify-between items-center h-14">
          <Link href="/" className="flex items-center space-x-2">
            <GraduationCap className="h-8 w-8 text-primary-600" />
            <span className="text-lg font-bold text-slate-900">
              Best Engineering Colleges
            </span>
          </Link>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center space-x-8">
            <Link
              href="/colleges"
              className="text-slate-700 hover:text-slate-900 transition-colors"
            >
              Colleges
            </Link>
            <Link
              href="/compare"
              className="text-slate-700 hover:text-slate-900 transition-colors"
            >
              Compare
            </Link>
            <Link
              href="/cities"
              className="text-slate-700 hover:text-slate-900 transition-colors"
            >
              Cities
            </Link>
            <Link
              href="/rankings"
              className="text-slate-700 hover:text-slate-900 transition-colors"
            >
              Rankings
            </Link>
            <Link
              href="/chat"
              className="bg-slate-900 text-white px-4 py-2 rounded-full shadow-lg shadow-black/30 hover:bg-slate-800 transition-colors"
            >
              AI Counselor
            </Link>
          </div>

          {/* Mobile menu button */}
          <button
            onClick={() => setIsOpen(!isOpen)}
            className="md:hidden p-2 rounded-md text-slate-700 hover:bg-slate-100"
          >
            {isOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
          </button>
          </div>
        </div>
      </div>

      {/* Mobile Navigation */}
      <div
        className={cn(
          "md:hidden mt-3 rounded-2xl border border-white/40 bg-white/90 backdrop-blur shadow-xl shadow-black/20",
          isOpen ? "block" : "hidden"
        )}
      >
        <div className="px-4 pt-2 pb-4 space-y-2">
          <Link
            href="/colleges"
            className="block px-3 py-2 text-slate-700 hover:bg-slate-100 rounded-md"
            onClick={() => setIsOpen(false)}
          >
            Colleges
          </Link>
          <Link
            href="/compare"
            className="block px-3 py-2 text-slate-700 hover:bg-slate-100 rounded-md"
            onClick={() => setIsOpen(false)}
          >
            Compare
          </Link>
          <Link
            href="/cities"
            className="block px-3 py-2 text-slate-700 hover:bg-slate-100 rounded-md"
            onClick={() => setIsOpen(false)}
          >
            Cities
          </Link>
          <Link
            href="/rankings"
            className="block px-3 py-2 text-slate-700 hover:bg-slate-100 rounded-md"
            onClick={() => setIsOpen(false)}
          >
            Rankings
          </Link>
          <Link
            href="/chat"
            className="block px-3 py-2 bg-slate-900 text-white rounded-md text-center"
            onClick={() => setIsOpen(false)}
          >
            AI Counselor
          </Link>
        </div>
      </div>
    </nav>
  );
}
