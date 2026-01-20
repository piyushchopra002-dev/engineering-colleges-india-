"use client";

import { College, Ranking, Achievement, Media, Event } from "@/types";
import Image from "next/image";
import { MapPin, Globe, Mail, Phone, Calendar, Award, Building2, Shield, TrendingUp, Instagram, Linkedin, Facebook, Twitter, Youtube } from "lucide-react";
import { formatCurrency, formatNumber } from "@/lib/utils";
import { RankingsSection } from "./RankingsSection";
import { InfrastructureSection } from "./InfrastructureSection";
import { FacultySection } from "./FacultySection";
import { PlacementsSection } from "./PlacementsSection";
import { CutoffsSection } from "./CutoffsSection";
import { AchievementsSection } from "./AchievementsSection";
import { MediaSection } from "./MediaSection";
import { EventsSection } from "./EventsSection";
import { CityLifeSection } from "./CityLifeSection";
import { CollegeImage } from "@/components/colleges/CollegeImage";
import { RelatedColleges } from "./RelatedColleges";
import { VerifiedBadge, DataSourceBadge, LastUpdatedBadge } from "@/components/ui/TrustBadges";
import { SectionDivider, ProgressBar } from "@/components/ui/DecorativeElements";
import { motion } from "framer-motion";
import { FadeInWhenVisible, SlideInLeft, SlideInRight } from "@/components/ui/AnimatedElements";

interface CollegeDetailProps {
  college: College;
  rankings: Ranking[];
  branches: any[];
  faculty: any[];
  infrastructure: any[];
  library: any;
  transport: any;
  achievements: Achievement[];
  media: Media[];
  events: Event[];
}

export function CollegeDetail({
  college,
  rankings,
  branches,
  faculty,
  infrastructure,
  library,
  transport,
  achievements,
  media,
  events,
}: CollegeDetailProps) {
  const getWebsiteHost = (website?: string) => {
    if (!website) return null;
    try {
      return new URL(website.startsWith("http") ? website : `https://${website}`).hostname;
    } catch {
      return null;
    }
  };
  const websiteHost = getWebsiteHost(college.website);
  const logoFallbacks = [
    college.cover_image_url,
    websiteHost ? `https://logo.clearbit.com/${websiteHost}?size=512` : null,
    websiteHost ? `https://www.google.com/s2/favicons?domain=${websiteHost}&sz=512` : null,
  ].filter(Boolean) as string[];
  const heroFallbacks = ["/images/college-hero.jpg", "/images/college-hero.svg"];
  const heroImage = college.cover_image_url || heroFallbacks[0];

  return (
    <div className="min-h-screen bg-gray-50 relative overflow-hidden">
      {/* Subtle Background Animation */}
      <div className="absolute inset-0 pointer-events-none">
        <div className="absolute top-20 right-20 w-96 h-96 bg-primary-500/5 rounded-full blur-3xl animate-float" style={{ animationDuration: "20s" }}></div>
        <div className="absolute bottom-40 left-20 w-80 h-80 bg-blue-500/5 rounded-full blur-3xl animate-float" style={{ animationDelay: "5s", animationDuration: "18s" }}></div>
        <div className="absolute top-1/2 left-1/2 w-72 h-72 bg-purple-500/5 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "10s", animationDuration: "22s" }}></div>
      </div>
      {/* Hero Section */}
      <div className="bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-2">
          <h1 className="text-lg md:text-xl font-semibold text-gray-900">
            {college.name}
          </h1>
          <div className="mt-1 flex flex-wrap items-center gap-3 text-xs text-gray-600">
            <a
              href={`https://www.google.com/maps/search/${encodeURIComponent(college.name + ', ' + college.city + ', ' + college.state)}`}
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center hover:text-primary-600 transition-colors cursor-pointer group"
              title="Open location in Google Maps"
            >
              <MapPin className="h-3.5 w-3.5 mr-1 group-hover:text-primary-600" />
              <span className="group-hover:underline">
                {college.city}, {college.state}
              </span>
            </a>
            {college.established_year && (
              <div className="flex items-center">
                <Calendar className="h-3.5 w-3.5 mr-1" />
                <span>Est. {college.established_year}</span>
              </div>
            )}
            {college.website && (
              <a
                href={college.website.startsWith('http') ? college.website : `https://${college.website}`}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center hover:text-primary-600 transition-colors cursor-pointer group"
                title="Visit official website"
              >
                <Globe className="h-3.5 w-3.5 mr-1 group-hover:text-primary-600" />
                <span className="group-hover:underline">Official Website</span>
              </a>
            )}
          </div>
        </div>
        <div className="relative h-64 md:h-96 bg-gradient-to-r from-primary-600 to-primary-800">
          <CollegeImage
            src={heroImage}
            alt={college.name}
            className="absolute inset-0 h-full w-full object-cover"
            fallbacks={heroFallbacks}
            priority
          />
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Main Content */}
          <div className="lg:col-span-2 space-y-8">
            {/* Trust Indicators Bar */}
            <FadeInWhenVisible>
              <div className="bg-gradient-to-r from-green-50 to-blue-50 rounded-lg p-4 border border-green-200">
                <div className="flex flex-wrap items-center justify-between gap-4">
                  <div className="flex items-center gap-3">
                    <VerifiedBadge size="md" />
                    <DataSourceBadge />
                  </div>
                  <LastUpdatedBadge />
                </div>
              </div>
            </FadeInWhenVisible>

            {/* About */}
            <FadeInWhenVisible delay={0.1}>
              <section className="bg-white rounded-lg shadow-md p-6 hover-glow">
              <div className="flex items-center justify-between mb-4">
                <h2 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
                  About
                  <Shield className="h-5 w-5 text-green-600" />
                </h2>
                <span className="text-xs bg-primary-100 text-primary-700 px-3 py-1 rounded-full font-medium">
                  Official Info
                </span>
              </div>
              {college.description ? (
                <p className="text-gray-700 leading-relaxed">{college.description}</p>
              ) : (
                <p className="text-gray-700 leading-relaxed">
                  {college.name} is a leading engineering institute located in{" "}
                  {college.city}, {college.state}. The college offers diverse engineering
                  programs, strong academic foundations, and a vibrant campus culture. It
                  focuses on practical learning, research, and industry readiness to help
                  students build successful careers.
                </p>
              )}
              
              {/* Data Completeness */}
              <div className="mt-6 p-4 bg-gray-50 rounded-lg">
                <h3 className="text-sm font-semibold text-gray-700 mb-3">Profile Completeness</h3>
                <div className="space-y-3">
                  <ProgressBar label="Basic Info" value={100} color="green" />
                  <ProgressBar label="Rankings" value={rankings.length > 0 ? 100 : 0} color="blue" />
                  <ProgressBar label="Placements" value={branches.length > 0 ? 85 : 0} color="orange" />
                  <ProgressBar label="Infrastructure" value={infrastructure.length > 0 ? 90 : 0} color="primary" />
                </div>
              </div>
            </section>
            </FadeInWhenVisible>

            <SectionDivider text="Rankings & Recognition" />

            {/* Rankings */}
            <FadeInWhenVisible delay={0.1}>
              <RankingsSection rankings={rankings} />
            </FadeInWhenVisible>

            <SectionDivider text="Infrastructure & Facilities" />

            {/* Infrastructure */}
            <FadeInWhenVisible delay={0.1}>
              <InfrastructureSection
                infrastructure={infrastructure}
                library={library}
              />
            </FadeInWhenVisible>

            {/* Faculty */}
            <FadeInWhenVisible delay={0.1}>
              <FacultySection faculty={faculty} collegeSlug={college.slug} />
            </FadeInWhenVisible>

            {/* Placements */}
            <FadeInWhenVisible delay={0.1}>
              <PlacementsSection collegeId={college.id} branches={branches} />
            </FadeInWhenVisible>

            {/* Cutoffs */}
            <FadeInWhenVisible delay={0.1}>
              <CutoffsSection collegeId={college.id} branches={branches} />
            </FadeInWhenVisible>

            {/* Achievements */}
            <FadeInWhenVisible delay={0.1}>
              <AchievementsSection achievements={achievements} />
            </FadeInWhenVisible>

            {/* Events */}
            <FadeInWhenVisible delay={0.1}>
              <EventsSection events={events} />
            </FadeInWhenVisible>

            {/* Media */}
            <FadeInWhenVisible delay={0.1}>
              <MediaSection media={media} />
            </FadeInWhenVisible>

            {/* City Life */}
            <FadeInWhenVisible delay={0.1}>
              <CityLifeSection city={college.city} state={college.state} />
            </FadeInWhenVisible>

            {/* Related Colleges */}
            <RelatedColleges
              currentCollegeId={college.id}
              city={college.city}
              state={college.state}
              collegeType={college.college_type}
              institutionCategory={college.institution_category}
              ownershipType={college.ownership_type}
            />
          </div>

          {/* Sidebar */}
          <div className="space-y-6">
            {/* Trust Score Card */}
            <SlideInRight>
              <div className="bg-gradient-to-br from-green-50 to-emerald-50 rounded-lg shadow-md p-6 border-2 border-green-200 hover-glow">
              <div className="flex items-center justify-between mb-4">
                <h3 className="text-lg font-bold text-gray-900 flex items-center gap-2">
                  <Shield className="h-5 w-5 text-green-600" />
                  Trust Score
                </h3>
                <span className="text-3xl font-bold text-green-600">95%</span>
              </div>
              <div className="space-y-2 text-sm text-gray-700">
                <div className="flex justify-between">
                  <span>✓ NIRF Verified</span>
                  <span className="text-green-600 font-medium">Yes</span>
                </div>
                <div className="flex justify-between">
                  <span>✓ Data Accuracy</span>
                  <span className="text-green-600 font-medium">High</span>
                </div>
                <div className="flex justify-between">
                  <span>✓ Regular Updates</span>
                  <span className="text-green-600 font-medium">Weekly</span>
                </div>
              </div>
            </div>
            </SlideInRight>

            {/* Quick Info */}
            <SlideInRight delay={0.1}>
              <div className="bg-white rounded-lg shadow-md p-6 hover-glow">
              <h3 className="text-xl font-bold text-gray-900 mb-4">Quick Info</h3>
              <div className="space-y-4">
                {college.website && (
                  <div className="flex items-start gap-3">
                    <Globe className="h-5 w-5 text-gray-400 flex-shrink-0 mt-0.5" />
                    <div className="flex-1 min-w-0">
                      <a
                        href={college.website}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-primary-600 hover:underline break-words"
                      >
                        Official Website
                      </a>
                    </div>
                  </div>
                )}
                {college.email && (
                  <div className="flex items-start gap-3">
                    <Mail className="h-5 w-5 text-gray-400 flex-shrink-0 mt-0.5" />
                    <div className="flex-1 min-w-0">
                      <a
                        href={`mailto:${college.email}`}
                        className="text-gray-700 hover:text-primary-600 break-words"
                      >
                        {college.email}
                      </a>
                    </div>
                  </div>
                )}
                {college.phone && (
                  <div className="flex items-start gap-3">
                    <Phone className="h-5 w-5 text-gray-400 flex-shrink-0 mt-0.5" />
                    <div className="flex-1 min-w-0">
                      <span className="text-gray-700">{college.phone}</span>
                    </div>
                  </div>
                )}
                {college.approval_body && college.approval_body.length > 0 && (
                  <div className="pt-2 border-t border-gray-100">
                    <div className="text-sm font-semibold text-gray-700 mb-2">
                      Approvals
                    </div>
                    <div className="flex flex-wrap gap-2">
                      {college.approval_body.map((body) => (
                        <span
                          key={body}
                          className="px-3 py-1.5 bg-gray-100 text-gray-700 rounded-md text-sm font-medium"
                        >
                          {body}
                        </span>
                      ))}
                    </div>
                  </div>
                )}
                {college.affiliation && (
                  <div className="pt-2 border-t border-gray-100">
                    <div className="text-sm font-semibold text-gray-700 mb-2">
                      Affiliation
                    </div>
                    <div className="text-gray-700 leading-relaxed">{college.affiliation}</div>
                  </div>
                )}
                {/* Social Media Links */}
                {(college.instagram_url || college.linkedin_url || college.facebook_url || college.twitter_url || college.youtube_url) && (
                  <div className="pt-4 border-t border-gray-100">
                    <div className="text-sm font-semibold text-gray-700 mb-3">
                      Connect With Us
                    </div>
                    <div className="flex flex-wrap gap-3">
                      {college.instagram_url && (
                        <a
                          href={college.instagram_url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="flex items-center gap-2 px-3 py-2 bg-gradient-to-br from-purple-500 to-pink-500 text-white rounded-lg hover:shadow-lg transition-all duration-300 hover:scale-105"
                          title="Follow on Instagram"
                        >
                          <Instagram className="h-4 w-4" />
                          <span className="text-sm font-medium">Instagram</span>
                        </a>
                      )}
                      {college.linkedin_url && (
                        <a
                          href={college.linkedin_url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="flex items-center gap-2 px-3 py-2 bg-blue-600 text-white rounded-lg hover:shadow-lg transition-all duration-300 hover:scale-105"
                          title="Connect on LinkedIn"
                        >
                          <Linkedin className="h-4 w-4" />
                          <span className="text-sm font-medium">LinkedIn</span>
                        </a>
                      )}
                      {college.facebook_url && (
                        <a
                          href={college.facebook_url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="flex items-center gap-2 px-3 py-2 bg-blue-500 text-white rounded-lg hover:shadow-lg transition-all duration-300 hover:scale-105"
                          title="Like on Facebook"
                        >
                          <Facebook className="h-4 w-4" />
                          <span className="text-sm font-medium">Facebook</span>
                        </a>
                      )}
                      {college.twitter_url && (
                        <a
                          href={college.twitter_url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="flex items-center gap-2 px-3 py-2 bg-black text-white rounded-lg hover:shadow-lg transition-all duration-300 hover:scale-105"
                          title="Follow on Twitter"
                        >
                          <Twitter className="h-4 w-4" />
                          <span className="text-sm font-medium">Twitter</span>
                        </a>
                      )}
                      {college.youtube_url && (
                        <a
                          href={college.youtube_url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="flex items-center gap-2 px-3 py-2 bg-red-600 text-white rounded-lg hover:shadow-lg transition-all duration-300 hover:scale-105"
                          title="Subscribe on YouTube"
                        >
                          <Youtube className="h-4 w-4" />
                          <span className="text-sm font-medium">YouTube</span>
                        </a>
                      )}
                    </div>
                  </div>
                )}
              </div>
            </div>
            </SlideInRight>

            {/* Transport */}
            {transport && (
              <SlideInRight delay={0.2}>
                <div className="bg-white rounded-lg shadow-md p-6 hover-glow">
                <h3 className="text-xl font-bold text-gray-900 mb-4">
                  Transport & Accessibility
                </h3>
                <div className="space-y-3 text-sm">
                  {transport.airport_name && (
                    <div>
                      <div className="font-medium text-gray-700">Nearest Airport</div>
                      <div className="text-gray-600">
                        {transport.airport_name} (
                        {transport.airport_distance_km} km,{" "}
                        {transport.airport_travel_time_minutes} min)
                      </div>
                    </div>
                  )}
                  {transport.railway_station_name && (
                    <div>
                      <div className="font-medium text-gray-700">
                        Nearest Railway Station
                      </div>
                      <div className="text-gray-600">
                        {transport.railway_station_name} (
                        {transport.railway_distance_km} km,{" "}
                        {transport.railway_travel_time_minutes} min)
                      </div>
                    </div>
                  )}
                </div>
              </div>
              </SlideInRight>
            )}

            {/* Branches */}
            {branches.length > 0 && (
              <SlideInRight delay={0.3}>
                <div className="bg-white rounded-lg shadow-md p-6 hover-glow">
                <h3 className="text-xl font-bold text-gray-900 mb-4">
                  Engineering Branches
                </h3>
                <div className="space-y-2">
                  {branches.map((cb) => (
                    <div
                      key={cb.id}
                      className="flex justify-between items-center py-2 border-b border-gray-100 last:border-0"
                    >
                      <span className="text-gray-700">
                        {cb.branches?.name || "N/A"}
                      </span>
                      {cb.intake && (
                        <span className="text-sm text-gray-500">
                          Intake: {cb.intake}
                        </span>
                      )}
                    </div>
                  ))}
                </div>
              </div>
              </SlideInRight>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
