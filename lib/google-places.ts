const GOOGLE_PLACES_API_KEY = process.env.NEXT_PUBLIC_GOOGLE_PLACES_API_KEY;

export interface PlaceDetails {
  place_id: string;
  name: string;
  formatted_address: string;
  geometry: {
    location: {
      lat: number;
      lng: number;
    };
  };
  rating?: number;
  photos?: Array<{
    photo_reference: string;
  }>;
}

export async function searchPlaces(query: string): Promise<PlaceDetails[]> {
  if (!GOOGLE_PLACES_API_KEY) {
    throw new Error("Google Places API key not configured");
  }

  const response = await fetch(
    `https://maps.googleapis.com/maps/api/place/textsearch/json?query=${encodeURIComponent(query)}&key=${GOOGLE_PLACES_API_KEY}`
  );

  if (!response.ok) {
    throw new Error("Google Places API error");
  }

  const data = await response.json();
  return data.results || [];
}

export async function getPlaceDetails(placeId: string): Promise<PlaceDetails | null> {
  if (!GOOGLE_PLACES_API_KEY) {
    throw new Error("Google Places API key not configured");
  }

  const response = await fetch(
    `https://maps.googleapis.com/maps/api/place/details/json?place_id=${placeId}&key=${GOOGLE_PLACES_API_KEY}`
  );

  if (!response.ok) {
    throw new Error("Google Places API error");
  }

  const data = await response.json();
  return data.result || null;
}

export function getPhotoUrl(photoReference: string, maxWidth: number = 400): string {
  if (!GOOGLE_PLACES_API_KEY) {
    return "";
  }
  return `https://maps.googleapis.com/maps/api/place/photo?maxwidth=${maxWidth}&photoreference=${photoReference}&key=${GOOGLE_PLACES_API_KEY}`;
}

export function getMapEmbedUrl(lat: number, lng: number, zoom: number = 15): string {
  if (!GOOGLE_PLACES_API_KEY) {
    return "";
  }
  return `https://www.google.com/maps/embed/v1/place?key=${GOOGLE_PLACES_API_KEY}&q=${lat},${lng}&zoom=${zoom}`;
}
