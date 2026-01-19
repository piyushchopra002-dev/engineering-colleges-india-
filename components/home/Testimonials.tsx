"use client";

import { Star, Quote } from "lucide-react";
import { useState } from "react";

const testimonials = [
  {
    name: "Rahul Sharma",
    role: "Engineering Student",
    college: "IIT Delhi",
    image: "https://ui-avatars.com/api/?name=Rahul+Sharma&background=random",
    content: "This platform helped me compare multiple colleges easily. The verified data and detailed information made my decision much easier!",
    rating: 5,
  },
  {
    name: "Priya Patel",
    role: "Parent",
    college: "NIT Trichy",
    image: "https://ui-avatars.com/api/?name=Priya+Patel&background=random",
    content: "As a parent, I needed reliable information about placements and infrastructure. This site provided everything I needed in one place.",
    rating: 5,
  },
  {
    name: "Amit Kumar",
    role: "JEE Aspirant",
    college: "BITS Pilani",
    image: "https://ui-avatars.com/api/?name=Amit+Kumar&background=random",
    content: "The compare feature is amazing! I could see cutoffs, placements, and rankings side by side. Highly recommended for college selection.",
    rating: 5,
  },
];

export function Testimonials() {
  const [activeIndex, setActiveIndex] = useState(0);

  return (
    <section className="py-16 bg-gradient-to-br from-primary-50 via-white to-blue-50 relative overflow-hidden">
      {/* Animated Decorative Elements */}
      <div className="absolute top-10 right-10 w-64 h-64 bg-primary-200/20 rounded-full blur-3xl animate-float" style={{ animationDuration: "15s" }}></div>
      <div className="absolute bottom-10 left-10 w-96 h-96 bg-blue-200/20 rounded-full blur-3xl animate-float animate-morph" style={{ animationDelay: "5s", animationDuration: "18s" }}></div>
      <div className="absolute top-1/2 left-1/3 w-72 h-72 bg-purple-200/15 rounded-full blur-3xl animate-float" style={{ animationDelay: "10s", animationDuration: "20s" }}></div>

      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-bold text-gray-900 mb-4">
            What Students & Parents Say
          </h2>
          <p className="text-gray-600 max-w-2xl mx-auto">
            Join thousands of students who made informed decisions using our platform
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {testimonials.map((testimonial, index) => (
            <div
              key={index}
              className="bg-white rounded-xl shadow-lg p-6 hover:shadow-2xl transition-all duration-300 hover:scale-105 relative"
              style={{ animationDelay: `${index * 0.1}s` }}
            >
              {/* Quote Icon */}
              <div className="absolute -top-4 -right-4 w-12 h-12 bg-primary-500 rounded-full flex items-center justify-center shadow-lg">
                <Quote className="h-6 w-6 text-white" />
              </div>

              {/* Profile */}
              <div className="flex items-center gap-4 mb-4">
                <img
                  src={testimonial.image}
                  alt={testimonial.name}
                  className="w-16 h-16 rounded-full border-2 border-primary-200"
                />
                <div>
                  <h3 className="font-semibold text-gray-900">{testimonial.name}</h3>
                  <p className="text-sm text-gray-600">{testimonial.role}</p>
                  <p className="text-xs text-primary-600 font-medium">{testimonial.college}</p>
                </div>
              </div>

              {/* Rating */}
              <div className="flex gap-1 mb-3">
                {Array.from({ length: testimonial.rating }).map((_, i) => (
                  <Star key={i} className="h-4 w-4 text-yellow-500 fill-yellow-500" />
                ))}
              </div>

              {/* Content */}
              <p className="text-gray-700 text-sm leading-relaxed">
                "{testimonial.content}"
              </p>
            </div>
          ))}
        </div>

        {/* Trust Stats */}
        <div className="mt-12 grid grid-cols-2 md:grid-cols-4 gap-6 text-center">
          <div className="bg-white rounded-lg p-4 shadow-md">
            <div className="text-3xl font-bold text-primary-600 mb-1">50K+</div>
            <div className="text-sm text-gray-600">Happy Students</div>
          </div>
          <div className="bg-white rounded-lg p-4 shadow-md">
            <div className="text-3xl font-bold text-green-600 mb-1">100%</div>
            <div className="text-sm text-gray-600">Verified Data</div>
          </div>
          <div className="bg-white rounded-lg p-4 shadow-md">
            <div className="text-3xl font-bold text-blue-600 mb-1">500+</div>
            <div className="text-sm text-gray-600">Colleges Listed</div>
          </div>
          <div className="bg-white rounded-lg p-4 shadow-md">
            <div className="text-3xl font-bold text-orange-600 mb-1">4.8/5</div>
            <div className="text-sm text-gray-600">User Rating</div>
          </div>
        </div>
      </div>
    </section>
  );
}
