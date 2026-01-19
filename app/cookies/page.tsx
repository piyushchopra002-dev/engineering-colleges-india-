import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Cookie Policy | Best Engineering Colleges",
  description: "Cookie policy for Best Engineering Colleges platform",
};

export default function CookiesPage() {
  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="bg-white rounded-lg shadow-md p-8">
          <h1 className="text-3xl font-bold text-gray-900 mb-6">Cookie Policy</h1>
          <div className="prose max-w-none">
            <p className="text-gray-700 mb-4">
              Last updated: {new Date().toLocaleDateString()}
            </p>
            <p className="text-gray-700">
              We use cookies to enhance your browsing experience and analyze site traffic.
              You can customize your cookie preferences at any time.
            </p>
            {/* Add full cookie policy content here */}
          </div>
        </div>
      </div>
    </div>
  );
}
