"use client";

import { useEffect, useMemo, useState } from "react";

interface CollegeImageProps {
  src?: string;
  alt: string;
  className?: string;
  fallbacks?: string[];
  priority?: boolean;
}

const fallbackFor = (alt: string) =>
  `https://ui-avatars.com/api/?name=${encodeURIComponent(alt)}&background=e5e7eb&color=374151&size=512`;

const resizeUrl = (url: string, size = 512) => {
  if (!url || url.includes("images.weserv.nl")) return url;
  if (url.startsWith("data:")) return url;
  if (!/^https?:\/\//i.test(url)) return url;
  // Enhanced image quality with sharpening and optimization
  return `https://images.weserv.nl/?url=${encodeURIComponent(url)}&w=${size}&h=${size}&fit=inside&sharp=1&q=85&il&output=webp`;
};

export function CollegeImage({
  src,
  alt,
  className,
  fallbacks = [],
  priority = false,
}: CollegeImageProps) {
  const fallback = useMemo(() => fallbackFor(alt), [alt]);
  const sources = useMemo(
    () => [src, ...fallbacks, fallback].filter(Boolean).map((url) => resizeUrl(url)) as string[],
    [src, fallbacks, fallback]
  );
  const [sourceIndex, setSourceIndex] = useState(0);

  useEffect(() => {
    setSourceIndex(0);
  }, [src, fallback, fallbacks.join("|")]);

  const currentSrc = sources[sourceIndex] || fallback;

  return (
    <img
      src={currentSrc}
      alt={alt}
      className={className}
      loading={priority ? "eager" : "lazy"}
      fetchPriority={priority ? "high" : "auto"}
      decoding="async"
      onError={() => {
        if (sourceIndex < sources.length - 1) {
          setSourceIndex(sourceIndex + 1);
        }
      }}
    />
  );
}
