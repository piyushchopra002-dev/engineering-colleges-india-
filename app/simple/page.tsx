// Simple test page without any database calls
export default function SimplePage() {
  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <h1 className="text-4xl font-bold text-gray-900 mb-4">
        Simple Test Page
      </h1>
      <p className="text-lg text-gray-600 mb-4">
        If you can see this page, the basic Next.js setup is working!
      </p>
      <div className="mt-8">
        <a
          href="/"
          className="text-primary-600 hover:underline"
        >
          ← Go back to home
        </a>
      </div>
    </div>
  );
}
