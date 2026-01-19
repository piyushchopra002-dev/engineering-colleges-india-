"use client";

import { useEffect, useState } from "react";
import { createSupabaseClient } from "@/lib/supabase/client";
import { MapPin, Clock, Calendar } from "lucide-react";
import Image from "next/image";

interface CityLifeSectionProps {
  city: string;
  state: string;
}

export function CityLifeSection({ city, state }: CityLifeSectionProps) {
  const [attractions, setAttractions] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchAttractions() {
      const supabase = createSupabaseClient();
      const { data } = await supabase
        .from("city_attractions")
        .select("*")
        .eq("city", city)
        .eq("state", state)
        .limit(12);

      if (data) setAttractions(data);
      setLoading(false);
    }
    fetchAttractions();
  }, [city, state]);

  if (loading) {
    return (
      <section className="bg-white rounded-lg shadow-md p-6">
        <h2 className="text-2xl font-bold text-gray-900 mb-6">City Life</h2>
        <div className="text-center py-8 text-gray-500">Loading...</div>
      </section>
    );
  }

  if (attractions.length === 0) return null;

  const groupedAttractions = attractions.reduce((acc, attraction) => {
    if (!acc[attraction.category]) {
      acc[attraction.category] = [];
    }
    acc[attraction.category].push(attraction);
    return acc;
  }, {} as Record<string, any[]>);

  const categoryLabels: Record<string, string> = {
    mall: "Shopping & Malls",
    cafe: "Cafes & Food",
    monument: "Monuments & Heritage",
    museum: "Museums",
    religious: "Religious Places",
    picnic: "Picnic & Travel Spots",
  };

  return (
    <section className="bg-white rounded-lg shadow-md p-6">
      <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center">
        <MapPin className="h-6 w-6 mr-2 text-primary-600" />
        City Life & Nearby Attractions
      </h2>
      <div className="space-y-6">
        {Object.entries(groupedAttractions).map(([category, items]) => (
          <div key={category}>
            <h3 className="text-lg font-semibold text-gray-800 mb-4">
              {categoryLabels[category] || category}
            </h3>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {items.map((attraction) => (
                <div
                  key={attraction.id}
                  className="border border-gray-200 rounded-lg overflow-hidden hover:shadow-md transition-shadow"
                >
                  {attraction.images && attraction.images.length > 0 && (
                    <div className="relative aspect-video">
                      <Image
                        src={attraction.images[0]}
                        alt={attraction.name}
                        fill
                        className="object-cover"
                      />
                    </div>
                  )}
                  <div className="p-4">
                    <h4 className="font-semibold text-gray-900 mb-2">
                      {attraction.name}
                    </h4>
                    {attraction.description && (
                      <p className="text-sm text-gray-600 mb-3 line-clamp-2">
                        {attraction.description}
                      </p>
                    )}
                    <div className="space-y-1 text-xs text-gray-500">
                      {attraction.distance_from_city_center_km && (
                        <div className="flex items-center">
                          <MapPin className="h-3 w-3 mr-1" />
                          {attraction.distance_from_city_center_km} km from city center
                          {attraction.travel_time_minutes &&
                            ` (${attraction.travel_time_minutes} min)`}
                        </div>
                      )}
                      {attraction.best_season && (
                        <div className="flex items-center">
                          <Calendar className="h-3 w-3 mr-1" />
                          Best season: {attraction.best_season}
                        </div>
                      )}
                      {attraction.ideal_duration && (
                        <div className="flex items-center">
                          <Clock className="h-3 w-3 mr-1" />
                          Duration: {attraction.ideal_duration}
                        </div>
                      )}
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
