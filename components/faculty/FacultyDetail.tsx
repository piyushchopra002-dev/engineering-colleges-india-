import Image from "next/image";
import Link from "next/link";
import { User, Award, BookOpen, Briefcase, ExternalLink, CheckCircle } from "lucide-react";
import { getInitials } from "@/lib/utils";

interface FacultyDetailProps {
  faculty: any;
}

export function FacultyDetail({ faculty }: FacultyDetailProps) {
  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="bg-white rounded-lg shadow-md p-8">
          <div className="flex flex-col md:flex-row gap-6 mb-8">
            {faculty.photo_url ? (
              <div className="relative w-32 h-32 rounded-full overflow-hidden flex-shrink-0">
                <Image
                  src={faculty.photo_url}
                  alt={faculty.name}
                  fill
                  className="object-cover"
                />
              </div>
            ) : (
              <div className="w-32 h-32 rounded-full bg-primary-100 flex items-center justify-center flex-shrink-0">
                <span className="text-4xl font-semibold text-primary-600">
                  {getInitials(faculty.name)}
                </span>
              </div>
            )}
            <div className="flex-1">
              <div className="flex items-center gap-2 mb-2">
                <h1 className="text-3xl font-bold text-gray-900">{faculty.name}</h1>
                {faculty.is_verified && (
                  <CheckCircle className="h-6 w-6 text-green-500" title="Verified" />
                )}
              </div>
              {faculty.designation && (
                <p className="text-xl text-gray-600 mb-2">{faculty.designation}</p>
              )}
              {faculty.colleges && (
                <Link
                  href={`/colleges/${faculty.colleges.slug}`}
                  className="text-primary-600 hover:underline"
                >
                  {faculty.colleges.name}
                </Link>
              )}
              {faculty.department && (
                <p className="text-gray-600 mt-2">{faculty.department}</p>
              )}
            </div>
          </div>

          {/* Bio */}
          {faculty.bio && (
            <div className="mb-6">
              <h2 className="text-xl font-semibold text-gray-900 mb-2">About</h2>
              <p className="text-gray-700 leading-relaxed">{faculty.bio}</p>
            </div>
          )}

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* Qualifications */}
            {faculty.qualifications && faculty.qualifications.length > 0 && (
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3 flex items-center">
                  <Award className="h-5 w-5 mr-2 text-primary-600" />
                  Qualifications
                </h3>
                <ul className="space-y-2">
                  {faculty.qualifications.map((qual: string, idx: number) => (
                    <li key={idx} className="text-gray-700">
                      • {qual}
                    </li>
                  ))}
                </ul>
              </div>
            )}

            {/* Experience */}
            {faculty.experience_years && (
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3 flex items-center">
                  <Briefcase className="h-5 w-5 mr-2 text-primary-600" />
                  Experience
                </h3>
                <p className="text-gray-700">{faculty.experience_years} years</p>
              </div>
            )}

            {/* Research Interests */}
            {faculty.research_interests && faculty.research_interests.length > 0 && (
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3 flex items-center">
                  <BookOpen className="h-5 w-5 mr-2 text-primary-600" />
                  Research Interests
                </h3>
                <div className="flex flex-wrap gap-2">
                  {faculty.research_interests.map((interest: string, idx: number) => (
                    <span
                      key={idx}
                      className="px-3 py-1 bg-primary-100 text-primary-800 rounded-full text-sm"
                    >
                      {interest}
                    </span>
                  ))}
                </div>
              </div>
            )}

            {/* Past Institutions */}
            {faculty.past_institutions && faculty.past_institutions.length > 0 && (
              <div>
                <h3 className="text-lg font-semibold text-gray-900 mb-3">Past Institutions</h3>
                <ul className="space-y-2">
                  {faculty.past_institutions.map((inst: string, idx: number) => (
                    <li key={idx} className="text-gray-700">
                      • {inst}
                    </li>
                  ))}
                </ul>
              </div>
            )}
          </div>

          {/* Publications */}
          {faculty.publications && faculty.publications.length > 0 && (
            <div className="mt-6">
              <h3 className="text-lg font-semibold text-gray-900 mb-3">Publications</h3>
              <div className="space-y-3">
                {faculty.publications.map((pub: any, idx: number) => (
                  <div key={idx} className="border-l-4 border-primary-500 pl-4 py-2">
                    <h4 className="font-medium text-gray-900">{pub.title}</h4>
                    {pub.journal && (
                      <p className="text-sm text-gray-600">{pub.journal}</p>
                    )}
                    {pub.year && (
                      <p className="text-xs text-gray-500">Year: {pub.year}</p>
                    )}
                    {pub.link && (
                      <a
                        href={pub.link}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-primary-600 hover:underline text-sm flex items-center mt-1"
                      >
                        View Publication
                        <ExternalLink className="h-3 w-3 ml-1" />
                      </a>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Links */}
          <div className="mt-6 flex gap-4">
            {faculty.linkedin_url && (
              <a
                href={faculty.linkedin_url}
                target="_blank"
                rel="noopener noreferrer"
                className="text-primary-600 hover:underline flex items-center"
              >
                LinkedIn
                <ExternalLink className="h-4 w-4 ml-1" />
              </a>
            )}
            {faculty.google_scholar_url && (
              <a
                href={faculty.google_scholar_url}
                target="_blank"
                rel="noopener noreferrer"
                className="text-primary-600 hover:underline flex items-center"
              >
                Google Scholar
                <ExternalLink className="h-4 w-4 ml-1" />
              </a>
            )}
            {faculty.email && (
              <a
                href={`mailto:${faculty.email}`}
                className="text-primary-600 hover:underline"
              >
                Email
              </a>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
