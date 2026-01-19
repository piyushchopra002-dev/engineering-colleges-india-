import { createSupabaseServerClient } from "@/lib/supabase/server";
import { AdminDashboard } from "@/components/admin/AdminDashboard";

export default async function AdminPage() {
  const supabase = createSupabaseServerClient();

  const [
    { count: colleges },
    { count: faculty },
    { count: placements },
    { count: events },
  ] = await Promise.all([
    supabase.from("colleges").select("*", { count: "exact", head: true }),
    supabase.from("faculty").select("*", { count: "exact", head: true }),
    supabase.from("placements").select("*", { count: "exact", head: true }),
    supabase.from("events").select("*", { count: "exact", head: true }),
  ]);

  return (
    <AdminDashboard
      stats={{
        colleges: colleges || 0,
        faculty: faculty || 0,
        placements: placements || 0,
        events: events || 0,
      }}
    />
  );
}
