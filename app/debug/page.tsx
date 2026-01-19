// Debug page to check what's working
export default function DebugPage() {
  const envVars = {
    hasSupabaseUrl: !!process.env.NEXT_PUBLIC_SUPABASE_URL,
    hasSupabaseKey: !!process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
    appUrl: process.env.NEXT_PUBLIC_APP_URL || "not set",
  };

  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <h1 className="text-3xl font-bold text-gray-900 mb-6">Debug Information</h1>
      
      <div className="bg-white rounded-lg shadow-md p-6 mb-6">
        <h2 className="text-xl font-semibold mb-4">Environment Variables</h2>
        <ul className="space-y-2">
          <li>
            <span className="font-medium">Supabase URL:</span>{" "}
            {envVars.hasSupabaseUrl ? (
              <span className="text-green-600">✅ Set</span>
            ) : (
              <span className="text-red-600">❌ Missing</span>
            )}
          </li>
          <li>
            <span className="font-medium">Supabase Key:</span>{" "}
            {envVars.hasSupabaseKey ? (
              <span className="text-green-600">✅ Set</span>
            ) : (
              <span className="text-red-600">❌ Missing</span>
            )}
          </li>
          <li>
            <span className="font-medium">App URL:</span> {envVars.appUrl}
          </li>
        </ul>
      </div>

      <div className="bg-white rounded-lg shadow-md p-6">
        <h2 className="text-xl font-semibold mb-4">Test Links</h2>
        <ul className="space-y-2">
          <li>
            <a href="/simple" className="text-primary-600 hover:underline">
              /simple - Simple test page (no database)
            </a>
          </li>
          <li>
            <a href="/test" className="text-primary-600 hover:underline">
              /test - Another test page
            </a>
          </li>
          <li>
            <a href="/" className="text-primary-600 hover:underline">
              / - Home page (with database)
            </a>
          </li>
        </ul>
      </div>
    </div>
  );
}
