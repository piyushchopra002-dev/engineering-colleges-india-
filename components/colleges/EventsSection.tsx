import { Event } from "@/types";
import { Calendar, Image as ImageIcon } from "lucide-react";
import Image from "next/image";

interface EventsSectionProps {
  events: Event[];
}

export function EventsSection({ events }: EventsSectionProps) {
  // Debug log
  console.log('EventsSection received events:', events?.length || 0);
  
  return (
    <section className="bg-white rounded-lg shadow-md p-6">
      <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center">
        <Calendar className="h-6 w-6 mr-2 text-primary-600" />
        Events & Campus Life
      </h2>
      {!events || events.length === 0 ? (
        <div className="text-center py-8 text-slate-600">
          No events data available yet
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {events.map((event) => (
          <div
            key={event.id}
            className="border border-gray-200 rounded-lg overflow-hidden hover:shadow-md transition-shadow"
          >
            {event.posters && event.posters.length > 0 ? (
              <div className="relative aspect-video">
                <Image
                  src={event.posters[0]}
                  alt={event.name}
                  fill
                  className="object-cover"
                />
              </div>
            ) : event.images && event.images.length > 0 ? (
              <div className="relative aspect-video">
                <Image
                  src={event.images[0]}
                  alt={event.name}
                  fill
                  className="object-cover"
                />
              </div>
            ) : (
              <div className="aspect-video bg-gray-200 flex items-center justify-center">
                <ImageIcon className="h-12 w-12 text-gray-400" />
              </div>
            )}
            <div className="p-4">
              <div className="flex items-center gap-2 mb-2">
                <span className="px-2 py-1 text-xs font-medium bg-primary-100 text-primary-800 rounded capitalize">
                  {event.event_type}
                </span>
                {event.year && (
                  <span className="text-sm text-gray-500">{event.year}</span>
                )}
              </div>
              <h3 className="font-semibold text-gray-900 mb-2">{event.name}</h3>
              {event.description && (
                <p className="text-sm text-gray-600 line-clamp-2 mb-2">
                  {event.description}
                </p>
              )}
              {event.celebrity_performances &&
                event.celebrity_performances.length > 0 && (
                  <div className="text-xs text-gray-500 mt-2">
                    Featured: {event.celebrity_performances.join(", ")}
                  </div>
                )}
            </div>
          </div>
        ))}
      </div>
      )}
    </section>
  );
}
