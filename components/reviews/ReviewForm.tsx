"use client";

import { useState } from "react";
import { createSupabaseClient } from "@/lib/supabase/client";
import { Star, X } from "lucide-react";

interface ReviewFormProps {
  collegeId: string;
  collegeName: string;
  onSuccess: () => void;
  onCancel: () => void;
}

export function ReviewForm({ collegeId, collegeName, onSuccess, onCancel }: ReviewFormProps) {
  const [formData, setFormData] = useState({
    user_name: "",
    user_email: "",
    user_type: "current_student" as const,
    graduation_year: new Date().getFullYear(),
    review_title: "",
    review_text: "",
    pros: "",
    cons: "",
    overall_rating: 0,
    infrastructure_rating: 0,
    academics_rating: 0,
    placements_rating: 0,
    faculty_rating: 0,
    campus_life_rating: 0,
  });

  const [hoveredRating, setHoveredRating] = useState<{[key: string]: number}>({});
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState("");

  const ratingCategories = [
    { key: "overall_rating", label: "Overall Rating", required: true },
    { key: "infrastructure_rating", label: "Infrastructure" },
    { key: "academics_rating", label: "Academics" },
    { key: "placements_rating", label: "Placements" },
    { key: "faculty_rating", label: "Faculty" },
    { key: "campus_life_rating", label: "Campus Life" },
  ];

  function renderStarRating(category: string, required: boolean = false) {
    const currentRating = formData[category as keyof typeof formData] as number;
    const hovered = hoveredRating[category] || 0;

    return (
      <div className="flex items-center gap-2">
        <div className="flex gap-1">
          {[1, 2, 3, 4, 5].map((star) => (
            <button
              key={star}
              type="button"
              onClick={() => setFormData({ ...formData, [category]: star })}
              onMouseEnter={() => setHoveredRating({ ...hoveredRating, [category]: star })}
              onMouseLeave={() => setHoveredRating({ ...hoveredRating, [category]: 0 })}
              className="focus:outline-none transition-transform hover:scale-110"
            >
              <Star
                className={`h-6 w-6 ${
                  star <= (hovered || currentRating)
                    ? "fill-yellow-400 text-yellow-400"
                    : "text-gray-300"
                }`}
              />
            </button>
          ))}
        </div>
        <span className="text-sm text-slate-600">
          {currentRating > 0 ? `${currentRating}/5` : required ? "Required *" : "Optional"}
        </span>
      </div>
    );
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError("");

    if (formData.overall_rating === 0) {
      setError("Please provide an overall rating");
      return;
    }

    if (formData.review_text.length < 50) {
      setError("Review must be at least 50 characters long");
      return;
    }

    setSubmitting(true);

    try {
      const supabase = createSupabaseClient();
      const { error: insertError } = await supabase.from("reviews").insert({
        college_id: collegeId,
        ...formData,
        is_approved: false, // Will be approved by admin
        is_verified: false,
        helpful_count: 0,
        not_helpful_count: 0,
      });

      if (insertError) throw insertError;

      alert("✅ Thank you! Your review has been submitted and will be visible after moderation.");
      onSuccess();
    } catch (err) {
      console.error("Error submitting review:", err);
      setError("Failed to submit review. Please try again.");
    } finally {
      setSubmitting(false);
    }
  }

  return (
    <div className="bg-slate-50 rounded-lg p-6 border border-slate-200">
      <div className="flex items-center justify-between mb-6">
        <h3 className="text-xl font-bold text-slate-900">Write a Review for {collegeName}</h3>
        <button
          onClick={onCancel}
          className="text-slate-500 hover:text-slate-700"
          type="button"
        >
          <X className="h-6 w-6" />
        </button>
      </div>

      <form onSubmit={handleSubmit} className="space-y-6">
        {/* Personal Information */}
        <div className="grid md:grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">
              Your Name *
            </label>
            <input
              type="text"
              required
              value={formData.user_name}
              onChange={(e) => setFormData({ ...formData, user_name: e.target.value })}
              className="w-full px-4 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              placeholder="Enter your name"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">
              Email (optional)
            </label>
            <input
              type="email"
              value={formData.user_email}
              onChange={(e) => setFormData({ ...formData, user_email: e.target.value })}
              className="w-full px-4 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              placeholder="your.email@example.com"
            />
          </div>
        </div>

        <div className="grid md:grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">
              You are a *
            </label>
            <select
              required
              value={formData.user_type}
              onChange={(e) => setFormData({ ...formData, user_type: e.target.value as any })}
              className="w-full px-4 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            >
              <option value="current_student">Current Student</option>
              <option value="alumni">Alumni</option>
              <option value="parent">Parent</option>
              <option value="visitor">Visitor</option>
            </select>
          </div>

          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">
              Graduation Year (if applicable)
            </label>
            <input
              type="number"
              value={formData.graduation_year}
              onChange={(e) => setFormData({ ...formData, graduation_year: parseInt(e.target.value) })}
              className="w-full px-4 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              min="2000"
              max="2030"
            />
          </div>
        </div>

        {/* Ratings */}
        <div className="space-y-4 p-4 bg-white rounded-lg">
          <h4 className="font-semibold text-slate-900 mb-4">Rate Your Experience</h4>
          {ratingCategories.map((category) => (
            <div key={category.key} className="flex items-center justify-between">
              <label className="text-sm font-medium text-slate-700">
                {category.label} {category.required && "*"}
              </label>
              {renderStarRating(category.key, category.required)}
            </div>
          ))}
        </div>

        {/* Review Title */}
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-2">
            Review Title *
          </label>
          <input
            type="text"
            required
            value={formData.review_title}
            onChange={(e) => setFormData({ ...formData, review_title: e.target.value })}
            className="w-full px-4 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            placeholder="Summarize your experience"
            maxLength={255}
          />
        </div>

        {/* Review Text */}
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-2">
            Your Review * (minimum 50 characters)
          </label>
          <textarea
            required
            value={formData.review_text}
            onChange={(e) => setFormData({ ...formData, review_text: e.target.value })}
            className="w-full px-4 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            rows={6}
            placeholder="Share your detailed experience..."
            minLength={50}
          />
          <div className="text-xs text-slate-500 mt-1">
            {formData.review_text.length} / 50 characters minimum
          </div>
        </div>

        {/* Pros and Cons */}
        <div className="grid md:grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">
              Pros (optional)
            </label>
            <textarea
              value={formData.pros}
              onChange={(e) => setFormData({ ...formData, pros: e.target.value })}
              className="w-full px-4 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              rows={3}
              placeholder="What did you like?"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">
              Cons (optional)
            </label>
            <textarea
              value={formData.cons}
              onChange={(e) => setFormData({ ...formData, cons: e.target.value })}
              className="w-full px-4 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              rows={3}
              placeholder="What could be improved?"
            />
          </div>
        </div>

        {/* Error Message */}
        {error && (
          <div className="p-4 bg-red-50 border border-red-200 rounded-lg text-red-700">
            {error}
          </div>
        )}

        {/* Submit Button */}
        <div className="flex items-center justify-end gap-4">
          <button
            type="button"
            onClick={onCancel}
            className="px-6 py-2 border border-slate-300 text-slate-700 rounded-lg hover:bg-slate-50 transition-colors"
          >
            Cancel
          </button>
          <button
            type="submit"
            disabled={submitting}
            className="px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors disabled:bg-slate-400"
          >
            {submitting ? "Submitting..." : "Submit Review"}
          </button>
        </div>

        <p className="text-xs text-slate-500 text-center">
          Your review will be published after verification by our team
        </p>
      </form>
    </div>
  );
}
