import Image from "next/image";
import { Building2, BookOpen, Clock } from "lucide-react";

interface InfrastructureSectionProps {
  infrastructure: any[];
  library: any;
}

export function InfrastructureSection({
  infrastructure,
  library,
}: InfrastructureSectionProps) {
  const groupedInfra = (infrastructure || []).reduce((acc, item) => {
    if (!acc[item.category]) {
      acc[item.category] = [];
    }
    acc[item.category].push(item);
    return acc;
  }, {} as Record<string, any[]>);

  return (
    <section className="bg-white rounded-lg shadow-md p-6">
      <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center">
        <Building2 className="h-6 w-6 mr-2 text-primary-600" />
        Infrastructure & Facilities
      </h2>

      {!library && infrastructure.length === 0 ? (
        <div className="text-center py-8 text-slate-600">
          No infrastructure data available yet
        </div>
      ) : (
        <>
          {/* Library */}
          {library && (
        <div className="mb-8">
          <h3 className="text-lg font-semibold text-gray-800 mb-4 flex items-center">
            <BookOpen className="h-5 w-5 mr-2" />
            Library
          </h3>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <div className="flex items-center mb-2">
                <Clock className="h-4 w-4 mr-2 text-gray-500" />
                <span className="text-sm font-medium text-gray-700">
                  {library.is_24x7 ? "24x7 Access" : "Timings Available"}
                </span>
              </div>
              {library.seating_capacity && (
                <div className="text-sm text-gray-600">
                  Seating Capacity: {library.seating_capacity}
                </div>
              )}
              {library.digital_resources && (
                <div className="mt-2 text-sm text-gray-600">
                  <div>Digital Resources:</div>
                  <ul className="list-disc list-inside ml-2">
                    {Object.entries(library.digital_resources).map(([key, value]) => (
                      <li key={key}>
                        {key}: {String(value)}
                      </li>
                    ))}
                  </ul>
                </div>
              )}
            </div>
            {library.images && library.images.length > 0 && (
              <div className="grid grid-cols-2 gap-2">
                {library.images.slice(0, 4).map((img: string, idx: number) => (
                  <div key={idx} className="relative aspect-video rounded-lg overflow-hidden">
                    <Image
                      src={img}
                      alt={`Library ${idx + 1}`}
                      fill
                      className="object-cover"
                    />
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      )}

      {/* Other Infrastructure */}
      {Object.keys(groupedInfra).length > 0 && Object.entries(groupedInfra).map(([category, items]) => (
        <div key={category} className="mb-6">
          <h3 className="text-lg font-semibold text-gray-800 mb-4 capitalize">
            {category.replace(/_/g, " ")}
          </h3>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {items.map((item) => (
              <div key={item.id} className="border border-gray-200 rounded-lg p-4">
                {item.name && (
                  <h4 className="font-medium text-gray-900 mb-2">{item.name}</h4>
                )}
                {item.description && (
                  <p className="text-sm text-gray-600 mb-2">{item.description}</p>
                )}
                {item.capacity && (
                  <div className="text-sm text-gray-500">Capacity: {item.capacity}</div>
                )}
                {item.images && item.images.length > 0 && (
                  <div className="mt-3 relative aspect-video rounded overflow-hidden">
                    <Image
                      src={item.images[0]}
                      alt={item.name || category}
                      fill
                      className="object-cover"
                    />
                  </div>
                )}
              </div>
            ))}
          </div>
        </div>
      ))}
      </>
      )}
    </section>
  );
}
