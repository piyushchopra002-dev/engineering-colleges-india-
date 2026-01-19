// Minimal page with no dependencies
export default function MinimalPage() {
  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center">
      <div className="text-center">
        <h1 className="text-4xl font-bold text-gray-900 mb-4">
          Website is Working! 🎉
        </h1>
        <p className="text-lg text-gray-600 mb-8">
          The basic setup is working correctly.
        </p>
        <a
          href="/"
          className="inline-block px-6 py-3 bg-primary-600 text-white font-semibold rounded-lg hover:bg-primary-700 transition-colors"
        >
          Go to Home Page
        </a>
      </div>
    </div>
  );
}
