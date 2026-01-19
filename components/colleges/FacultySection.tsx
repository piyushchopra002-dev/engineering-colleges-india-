import Link from "next/link";
import Image from "next/image";
import { User, ExternalLink } from "lucide-react";
import { getInitials } from "@/lib/utils";

interface FacultySectionProps {
  faculty: any[];
  collegeSlug: string;
}

export function FacultySection({ faculty, collegeSlug }: FacultySectionProps) {
  return (
    <section className="bg-white rounded-lg shadow-md p-6">
      <div className="flex items-center justify-between mb-6">
        <h2 className="text-2xl font-bold text-gray-900 flex items-center">
          <User className="h-6 w-6 mr-2 text-primary-600" />
          Faculty
        </h2>
        <Link
          href={`/colleges/${collegeSlug}/faculty`}
          className="text-primary-600 hover:underline text-sm font-medium"
        >
          View All Faculty
        </Link>
      </div>
      {faculty.length === 0 ? (
        <div className="text-center py-8 text-slate-600">
          No faculty data available yet
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        {faculty.map((member) => (
          <Link
            key={member.id}
            href={`/faculty/${member.slug}`}
            className="border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow"
          >
            <div className="flex items-start gap-4">
              {member.photo_url ? (
                <div className="relative w-16 h-16 rounded-full overflow-hidden flex-shrink-0">
                  <Image
                    src={member.photo_url}
                    alt={member.name}
                    fill
                    className="object-cover"
                  />
                </div>
              ) : (
                <div className="w-16 h-16 rounded-full bg-primary-100 flex items-center justify-center flex-shrink-0">
                  <span className="text-primary-600 font-semibold">
                    {getInitials(member.name)}
                  </span>
                </div>
              )}
              <div className="flex-1 min-w-0">
                <h3 className="font-semibold text-gray-900 mb-1 truncate">
                  {member.name}
                </h3>
                {member.designation && (
                  <p className="text-sm text-gray-600 mb-2">{member.designation}</p>
                )}
                {member.department && (
                  <p className="text-xs text-gray-500 mb-2">{member.department}</p>
                )}
                {member.experience_years && (
                  <p className="text-xs text-gray-500">
                    {member.experience_years} years experience
                  </p>
                )}
                {member.is_verified && (
                  <span className="inline-block mt-2 px-2 py-1 text-xs font-medium bg-green-100 text-green-800 rounded">
                    Verified
                  </span>
                )}
              </div>
            </div>
          </Link>
        ))}
      </div>
      )}
    </section>
  );
}
