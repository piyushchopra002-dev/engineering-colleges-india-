import { Metadata } from "next";
import Link from "next/link";
import { createSupabaseServerClient } from "@/lib/supabase/server";

export const metadata: Metadata = {
  title: "College Events | Engineering Colleges",
  description: "Cultural, technical, and sports events across engineering colleges.",
};

export default async function EventsPage() {
  const supabase = createSupabaseServerClient();
  const { data: events } = await supabase
    .from("events")
    .select("id, name, slug, event_type, description, start_date, end_date, year, colleges(name, slug)")
    .order("year", { ascending: false })
    .limit(200);

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-6">College Events</h1>

        {events && events.length > 0 ? (
          <div className="grid grid-cols-1 gap-4">
            {events.map((event: any) => (
              <div key={event.id} className="bg-white rounded-lg shadow-md p-5">
                <div className="flex items-center justify-between">
                  <h2 className="text-xl font-semibold text-gray-900">{event.name}</h2>
                  {event.year && (
                    <span className="text-sm text-gray-500">{event.year}</span>
                  )}
                </div>
                <div className="text-sm text-gray-600 mt-1">
                  {event.event_type?.toUpperCase()}
                </div>
                {event.colleges?.name && (
                  <Link
                    href={`/colleges/${event.colleges.slug}`}
                    className="text-sm text-primary-600 hover:underline mt-2 inline-block"
                  >
                    {event.colleges.name}
                  </Link>
                )}
                {event.description && (
                  <p className="text-gray-700 mt-2">{event.description}</p>
                )}
              </div>
            ))}
          </div>
        ) : (
          <div className="bg-white rounded-lg shadow-md p-6 text-gray-600">
            No events found yet.
          </div>
        )}
      </div>
    </div>
  );
}
