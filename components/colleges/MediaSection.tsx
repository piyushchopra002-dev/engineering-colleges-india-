"use client";

import { Media } from "@/types";
import { Youtube, Instagram, Play } from "lucide-react";
import { useState } from "react";

interface MediaSectionProps {
  media: Media[];
}

export function MediaSection({ media }: MediaSectionProps) {
  const [selectedMedia, setSelectedMedia] = useState<Media | null>(null);

  const groupedMedia = media.reduce((acc, item) => {
    if (!acc[item.media_type]) {
      acc[item.media_type] = [];
    }
    acc[item.media_type].push(item);
    return acc;
  }, {} as Record<string, Media[]>);

  const getEmbedUrl = (mediaItem: Media) => {
    if (mediaItem.platform === "youtube" && mediaItem.embed_id) {
      return `https://www.youtube.com/embed/${mediaItem.embed_id}`;
    }
    if (mediaItem.platform === "instagram" && mediaItem.embed_id) {
      return `https://www.instagram.com/p/${mediaItem.embed_id}/embed`;
    }
    return null;
  };

  return (
    <section className="bg-white rounded-lg shadow-md p-6">
      <h2 className="text-2xl font-bold text-gray-900 mb-6">Media & Videos</h2>
      <div className="space-y-6">
        {Object.entries(groupedMedia).map(([type, items]) => (
          <div key={type}>
            <h3 className="text-lg font-semibold text-gray-800 mb-4 capitalize">
              {type.replace(/_/g, " ")}
            </h3>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
              {items.map((item) => {
                const embedUrl = getEmbedUrl(item);
                return (
                  <div
                    key={item.id}
                    className="border border-gray-200 rounded-lg overflow-hidden hover:shadow-md transition-shadow cursor-pointer"
                    onClick={() => setSelectedMedia(item)}
                  >
                    {item.thumbnail_url ? (
                      <div className="relative aspect-video">
                        <img
                          src={item.thumbnail_url}
                          alt={item.title}
                          className="w-full h-full object-cover"
                        />
                        <div className="absolute inset-0 flex items-center justify-center bg-black bg-opacity-30">
                          {item.platform === "youtube" ? (
                            <Youtube className="h-12 w-12 text-white" />
                          ) : (
                            <Instagram className="h-12 w-12 text-white" />
                          )}
                        </div>
                      </div>
                    ) : (
                      <div className="aspect-video bg-gray-200 flex items-center justify-center">
                        {item.platform === "youtube" ? (
                          <Youtube className="h-12 w-12 text-gray-400" />
                        ) : (
                          <Instagram className="h-12 w-12 text-gray-400" />
                        )}
                      </div>
                    )}
                    <div className="p-3">
                      <h4 className="font-medium text-gray-900 text-sm line-clamp-2">
                        {item.title}
                      </h4>
                      {item.channel_name && (
                        <p className="text-xs text-gray-500 mt-1">
                          {item.channel_name}
                        </p>
                      )}
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        ))}
      </div>

      {/* Modal */}
      {selectedMedia && (
        <div
          className="fixed inset-0 z-50 bg-black bg-opacity-75 flex items-center justify-center p-4"
          onClick={() => setSelectedMedia(null)}
        >
          <div
            className="bg-white rounded-lg max-w-4xl w-full max-h-[90vh] overflow-auto"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="p-4 border-b border-gray-200 flex items-center justify-between">
              <h3 className="font-semibold text-gray-900">{selectedMedia.title}</h3>
              <button
                onClick={() => setSelectedMedia(null)}
                className="text-gray-400 hover:text-gray-600"
              >
                ×
              </button>
            </div>
            <div className="p-4">
              {getEmbedUrl(selectedMedia) ? (
                <div className="aspect-video">
                  <iframe
                    src={getEmbedUrl(selectedMedia) || ""}
                    className="w-full h-full"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowFullScreen
                  />
                </div>
              ) : (
                <a
                  href={selectedMedia.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="block text-center py-8 text-primary-600 hover:underline"
                >
                  View on {selectedMedia.platform === "youtube" ? "YouTube" : "Instagram"}
                </a>
              )}
              {selectedMedia.description && (
                <p className="mt-4 text-gray-600">{selectedMedia.description}</p>
              )}
            </div>
          </div>
        </div>
      )}
    </section>
  );
}
