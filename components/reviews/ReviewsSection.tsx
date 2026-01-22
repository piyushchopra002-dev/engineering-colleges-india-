"use client";

import { useEffect, useState } from "react";
import { createSupabaseClient } from "@/lib/supabase/client";
import { Star, ThumbsUp, ThumbsDown, MessageCircle, Award, CheckCircle } from "lucide-react";
import { Review } from "@/types";
import { ReviewForm } from "./ReviewForm";

interface ReviewsSectionProps {
  collegeId: string;
  collegeName: string;
}

export function ReviewsSection({ collegeId, collegeName }: ReviewsSectionProps) {
  const [reviews, setReviews] = useState<Review[]>([]);
  const [loading, setLoading] = useState(true);
  const [showForm, setShowForm] = useState(false);
  const [stats, setStats] = useState({
    averageRating: 0,
    totalReviews: 0,
    ratingDistribution: { 5: 0, 4: 0, 3: 0, 2: 0, 1: 0 }
  });

  useEffect(() => {
    fetchReviews();
  }, [collegeId]);

  async function fetchReviews() {
    const supabase = createSupabaseClient();
    
    const { data, error } = await supabase
      .from("reviews")
      .select("*, branches(name)")
      .eq("college_id", collegeId)
      .eq("is_approved", true)
      .order("is_featured", { ascending: false })
      .order("created_at", { ascending: false })
      .limit(20);

    if (data && !error) {
      setReviews(data);
      calculateStats(data);
    }
    setLoading(false);
  }

  function calculateStats(reviewsData: Review[]) {
    if (reviewsData.length === 0) return;

    const total = reviewsData.length;
    const sum = reviewsData.reduce((acc, r) => acc + r.overall_rating, 0);
    const avg = sum / total;

    const distribution = reviewsData.reduce((acc, r) => {
      const rating = Math.round(r.overall_rating);
      acc[rating as keyof typeof acc] = (acc[rating as keyof typeof acc] || 0) + 1;
      return acc;
    }, { 5: 0, 4: 0, 3: 0, 2: 0, 1: 0 });

    setStats({
      averageRating: avg,
      totalReviews: total,
      ratingDistribution: distribution
    });
  }

  function renderStars(rating: number, size: "sm" | "md" | "lg" = "md") {
    const sizeClasses = {
      sm: "h-4 w-4",
      md: "h-5 w-5",
      lg: "h-6 w-6"
    };

    return (
      <div className="flex items-center gap-1">
        {[1, 2, 3, 4, 5].map((star) => (
          <Star
            key={star}
            className={`${sizeClasses[size]} ${
              star <= rating ? "fill-yellow-400 text-yellow-400" : "text-gray-300"
            }`}
          />
        ))}
      </div>
    );
  }

  if (loading) {
    return (
      <section className="bg-white rounded-lg shadow-md p-6">
        <h2 className="text-2xl font-bold text-slate-900 mb-6">Student Reviews</h2>
        <div className="text-center py-8 text-slate-600">Loading reviews...</div>
      </section>
    );
  }

  return (
    <section className="bg-white rounded-lg shadow-md p-6">
      {/* Header with overall rating */}
      <div className="mb-8">
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-2xl font-bold text-slate-900 flex items-center">
            <MessageCircle className="h-6 w-6 mr-2 text-primary-600" />
            Student Reviews
          </h2>
          <button
            onClick={() => setShowForm(!showForm)}
            className="px-4 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors"
          >
            Write a Review
          </button>
        </div>

        {reviews.length > 0 && (
          <div className="grid md:grid-cols-3 gap-6 p-6 bg-gradient-to-r from-primary-50 to-blue-50 rounded-lg">
            {/* Average Rating */}
            <div className="text-center">
              <div className="text-5xl font-bold text-slate-900 mb-2">
                {stats.averageRating.toFixed(1)}
              </div>
              {renderStars(Math.round(stats.averageRating), "lg")}
              <div className="text-sm text-slate-600 mt-2">
                Based on {stats.totalReviews} reviews
              </div>
            </div>

            {/* Rating Distribution */}
            <div className="md:col-span-2">
              {[5, 4, 3, 2, 1].map((rating) => {
                const count = stats.ratingDistribution[rating as keyof typeof stats.ratingDistribution];
                const percentage = stats.totalReviews > 0 ? (count / stats.totalReviews) * 100 : 0;

                return (
                  <div key={rating} className="flex items-center gap-2 mb-2">
                    <div className="flex items-center gap-1 w-16">
                      <span className="text-sm font-medium text-slate-700">{rating}</span>
                      <Star className="h-3 w-3 fill-yellow-400 text-yellow-400" />
                    </div>
                    <div className="flex-1 bg-gray-200 rounded-full h-2">
                      <div
                        className="bg-yellow-400 h-2 rounded-full transition-all"
                        style={{ width: `${percentage}%` }}
                      />
                    </div>
                    <span className="text-sm text-slate-600 w-12 text-right">
                      {count}
                    </span>
                  </div>
                );
              })}
            </div>
          </div>
        )}
      </div>

      {/* Review Form */}
      {showForm && (
        <div className="mb-8">
          <ReviewForm
            collegeId={collegeId}
            collegeName={collegeName}
            onSuccess={() => {
              setShowForm(false);
              fetchReviews();
            }}
            onCancel={() => setShowForm(false)}
          />
        </div>
      )}

      {/* Reviews List */}
      {reviews.length === 0 ? (
        <div className="text-center py-12">
          <MessageCircle className="h-16 w-16 text-slate-300 mx-auto mb-4" />
          <p className="text-slate-600 mb-4">No reviews yet. Be the first to review!</p>
          <button
            onClick={() => setShowForm(true)}
            className="px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors"
          >
            Write a Review
          </button>
        </div>
      ) : (
        <div className="space-y-6">
          {reviews.map((review) => (
            <div
              key={review.id}
              className={`border rounded-lg p-6 ${
                review.is_featured ? "border-yellow-400 bg-yellow-50" : "border-slate-200"
              }`}
            >
              {/* Review Header */}
              <div className="flex items-start justify-between mb-4">
                <div className="flex-1">
                  <div className="flex items-center gap-2 mb-2">
                    <h3 className="font-semibold text-slate-900">{review.review_title}</h3>
                    {review.is_featured && (
                      <Award className="h-5 w-5 text-yellow-500" title="Featured Review" />
                    )}
                    {review.is_verified && (
                      <CheckCircle className="h-5 w-5 text-green-500" title="Verified Student" />
                    )}
                  </div>
                  <div className="flex items-center gap-3 text-sm text-slate-600">
                    <span className="font-medium">{review.user_name}</span>
                    <span>•</span>
                    <span className="capitalize">{review.user_type.replace("_", " ")}</span>
                    {review.graduation_year && (
                      <>
                        <span>•</span>
                        <span>Class of {review.graduation_year}</span>
                      </>
                    )}
                    {review.branches && (
                      <>
                        <span>•</span>
                        <span>{review.branches.name}</span>
                      </>
                    )}
                  </div>
                </div>
                <div className="text-right">
                  {renderStars(review.overall_rating)}
                  <div className="text-xs text-slate-500 mt-1">
                    {new Date(review.created_at).toLocaleDateString()}
                  </div>
                </div>
              </div>

              {/* Individual Ratings */}
              {(review.infrastructure_rating || review.academics_rating || 
                review.placements_rating || review.faculty_rating || 
                review.campus_life_rating) && (
                <div className="grid grid-cols-2 md:grid-cols-5 gap-4 mb-4 p-4 bg-slate-50 rounded-lg">
                  {review.infrastructure_rating && (
                    <div>
                      <div className="text-xs text-slate-600 mb-1">Infrastructure</div>
                      {renderStars(review.infrastructure_rating, "sm")}
                    </div>
                  )}
                  {review.academics_rating && (
                    <div>
                      <div className="text-xs text-slate-600 mb-1">Academics</div>
                      {renderStars(review.academics_rating, "sm")}
                    </div>
                  )}
                  {review.placements_rating && (
                    <div>
                      <div className="text-xs text-slate-600 mb-1">Placements</div>
                      {renderStars(review.placements_rating, "sm")}
                    </div>
                  )}
                  {review.faculty_rating && (
                    <div>
                      <div className="text-xs text-slate-600 mb-1">Faculty</div>
                      {renderStars(review.faculty_rating, "sm")}
                    </div>
                  )}
                  {review.campus_life_rating && (
                    <div>
                      <div className="text-xs text-slate-600 mb-1">Campus Life</div>
                      {renderStars(review.campus_life_rating, "sm")}
                    </div>
                  )}
                </div>
              )}

              {/* Review Text */}
              <p className="text-slate-700 mb-4 leading-relaxed">{review.review_text}</p>

              {/* Pros and Cons */}
              {(review.pros || review.cons) && (
                <div className="grid md:grid-cols-2 gap-4 mb-4">
                  {review.pros && (
                    <div className="p-4 bg-green-50 rounded-lg border border-green-200">
                      <div className="font-semibold text-green-800 mb-2">✓ Pros</div>
                      <p className="text-sm text-green-700">{review.pros}</p>
                    </div>
                  )}
                  {review.cons && (
                    <div className="p-4 bg-red-50 rounded-lg border border-red-200">
                      <div className="font-semibold text-red-800 mb-2">✗ Cons</div>
                      <p className="text-sm text-red-700">{review.cons}</p>
                    </div>
                  )}
                </div>
              )}

              {/* Helpful Votes */}
              <div className="flex items-center gap-4 pt-4 border-t border-slate-200">
                <span className="text-sm text-slate-600">Was this helpful?</span>
                <button className="flex items-center gap-1 text-sm text-slate-600 hover:text-green-600">
                  <ThumbsUp className="h-4 w-4" />
                  <span>{review.helpful_count}</span>
                </button>
                <button className="flex items-center gap-1 text-sm text-slate-600 hover:text-red-600">
                  <ThumbsDown className="h-4 w-4" />
                  <span>{review.not_helpful_count}</span>
                </button>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Review Schema Markup */}
      {reviews.length > 0 && (
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              "@context": "https://schema.org",
              "@type": "Product",
              "name": collegeName,
              "aggregateRating": {
                "@type": "AggregateRating",
                "ratingValue": stats.averageRating.toFixed(1),
                "reviewCount": stats.totalReviews,
                "bestRating": "5",
                "worstRating": "1"
              },
              "review": reviews.slice(0, 5).map((review) => ({
                "@type": "Review",
                "author": {
                  "@type": "Person",
                  "name": review.user_name
                },
                "datePublished": review.created_at,
                "reviewBody": review.review_text,
                "reviewRating": {
                  "@type": "Rating",
                  "ratingValue": review.overall_rating,
                  "bestRating": "5",
                  "worstRating": "1"
                }
              }))
            })
          }}
        />
      )}
    </section>
  );
}
