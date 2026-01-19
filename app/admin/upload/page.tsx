import { createSupabaseServerClient } from "@/lib/supabase/server";
import { LogoUploader } from "@/components/admin/LogoUploader";

export default async function AdminUploadPage() {
  const supabase = createSupabaseServerClient();
  const { data: colleges } = await supabase
    .from("colleges")
    .select("id, name, slug")
    .order("name", { ascending: true });

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-6">Upload College Logos</h1>
        <LogoUploader colleges={colleges || []} />
      </div>
    </div>
  );
}
