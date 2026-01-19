import { NextResponse } from "next/server";
import { createSupabaseAdminClient } from "@/lib/supabase/client";

const BUCKET_NAME = "college-logos";

async function ensureBucket(supabase: ReturnType<typeof createSupabaseAdminClient>) {
  const { data: buckets } = await supabase.storage.listBuckets();
  const exists = buckets?.some((b) => b.name === BUCKET_NAME);
  if (!exists) {
    const { error } = await supabase.storage.createBucket(BUCKET_NAME, { public: true });
    if (error && !String(error.message || "").includes("already exists")) {
      throw error;
    }
  }
}

export async function POST(request: Request) {
  try {
    const supabase = createSupabaseAdminClient();
    const formData = await request.formData();
    const file = formData.get("file") as File | null;
    const collegeId = formData.get("collegeId") as string | null;
    const slug = formData.get("slug") as string | null;

    if (!file || !collegeId || !slug) {
      return NextResponse.json({ error: "Missing file or college info" }, { status: 400 });
    }

    await ensureBucket(supabase);

    const arrayBuffer = await file.arrayBuffer();
    const buffer = Buffer.from(arrayBuffer);
    const ext = file.name.split(".").pop() || "png";
    const filePath = `${slug}.${ext}`;

    const { error: uploadError } = await supabase.storage
      .from(BUCKET_NAME)
      .upload(filePath, buffer, {
        upsert: true,
        contentType: file.type || "image/png",
      });

    if (uploadError) {
      return NextResponse.json({ error: uploadError.message }, { status: 500 });
    }

    const { data } = supabase.storage.from(BUCKET_NAME).getPublicUrl(filePath);
    const publicUrl = data.publicUrl;

    const { error: updateError } = await supabase
      .from("colleges")
      .update({ logo_url: publicUrl })
      .eq("id", collegeId);

    if (updateError) {
      return NextResponse.json({ error: updateError.message }, { status: 500 });
    }

    return NextResponse.json({ url: publicUrl });
  } catch (error: any) {
    return NextResponse.json({ error: error?.message || "Upload failed" }, { status: 500 });
  }
}
