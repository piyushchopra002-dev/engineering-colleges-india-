import Link from "next/link";
import { createSupabaseServerClient } from "@/lib/supabase/server";

export default async function AdminEventsPage() {
  const supabase = createSupabaseServerClient();
  const { data: events } = await supabase
    .from("events")
    .select("id, name, year, event_type, colleges(name, slug)")
    .order("year", { ascending: false })
    .limit(200);

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Events</h1>
        <Link href="/events" className="text-primary-600 hover:underline text-sm">
          View public page
        </Link>
      </div>

      {events && events.length > 0 ? (
        <div className="bg-white rounded-lg shadow-md p-4">
          <div className="space-y-3">
            {events.map((event: any) => (
              <div key={event.id} className="border-b border-gray-100 pb-3 last:border-0">
                <div className="font-medium text-gray-900">{event.name}</div>
                <div className="text-sm text-gray-600">
                  {event.event_type} {event.year ? `• ${event.year}` : ""}
                </div>
                {event.colleges?.name && (
                  <Link
                    href={`/colleges/${event.colleges.slug}`}
                    className="text-sm text-primary-600 hover:underline"
                  >
                    {event.colleges.name}
                  </Link>
                )}
              </div>
            ))}
          </div>
        </div>
      ) : (
        <div className="bg-white rounded-lg shadow-md p-6 text-gray-600">
          No events found yet.
        </div>
      )}
    </div>
  );
}
