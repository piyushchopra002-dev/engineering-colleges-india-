import { createClient } from "@supabase/supabase-js";

export const createSupabaseServerClient = () => {
  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  
  if (!supabaseUrl || !supabaseAnonKey) {
    // Return a client that will fail gracefully
    return createClient("https://placeholder.supabase.co", "placeholder-key");
  }
  
  return createClient(supabaseUrl, supabaseAnonKey);
};
