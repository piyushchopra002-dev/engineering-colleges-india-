import { ImageResponse } from "next/og";
import { NextRequest } from "next/server";

export const runtime = "edge";

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url);

    // Get parameters
    const type = searchParams.get("type") || "city";
    const title = searchParams.get("title") || "Engineering Colleges";
    const subtitle = searchParams.get("subtitle") || "";
    const stats = searchParams.get("stats")?.split("|") || [];

    // Define colors based on type
    const colorSchemes: Record<
      string,
      { gradient: string[]; accent: string }
    > = {
      city: {
        gradient: ["#3B82F6", "#8B5CF6"],
        accent: "#60A5FA",
      },
      comparison: {
        gradient: ["#8B5CF6", "#EC4899"],
        accent: "#A78BFA",
      },
      ranking: {
        gradient: ["#F59E0B", "#EF4444"],
        accent: "#FCD34D",
      },
      cutoff: {
        gradient: ["#10B981", "#06B6D4"],
        accent: "#34D399",
      },
    };

    const colors = colorSchemes[type] || colorSchemes.city;

    return new ImageResponse(
      (
        <div
          style={{
            height: "100%",
            width: "100%",
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            justifyContent: "center",
            background: `linear-gradient(135deg, ${colors.gradient[0]}, ${colors.gradient[1]})`,
            fontFamily: "system-ui, sans-serif",
          }}
        >
          {/* Background Pattern */}
          <div
            style={{
              position: "absolute",
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              opacity: 0.1,
              backgroundImage:
                "radial-gradient(circle at 25px 25px, white 2%, transparent 0%), radial-gradient(circle at 75px 75px, white 2%, transparent 0%)",
              backgroundSize: "100px 100px",
            }}
          />

          {/* Content Container */}
          <div
            style={{
              display: "flex",
              flexDirection: "column",
              alignItems: "center",
              justifyContent: "center",
              padding: "80px",
              textAlign: "center",
              position: "relative",
              zIndex: 1,
            }}
          >
            {/* Type Badge */}
            <div
              style={{
                background: "rgba(255, 255, 255, 0.2)",
                backdropFilter: "blur(10px)",
                padding: "12px 32px",
                borderRadius: "50px",
                fontSize: "24px",
                fontWeight: "600",
                color: "white",
                marginBottom: "32px",
                textTransform: "uppercase",
                letterSpacing: "2px",
              }}
            >
              {type === "city" && "🏙️ City Guide"}
              {type === "comparison" && "⚖️ Comparison"}
              {type === "ranking" && "🏆 Rankings"}
              {type === "cutoff" && "🎯 Cutoffs"}
            </div>

            {/* Main Title */}
            <div
              style={{
                fontSize: title.length > 30 ? "56px" : "72px",
                fontWeight: "bold",
                color: "white",
                marginBottom: "24px",
                lineHeight: 1.2,
                maxWidth: "900px",
                textShadow: "0 4px 12px rgba(0, 0, 0, 0.3)",
              }}
            >
              {title}
            </div>

            {/* Subtitle */}
            {subtitle && (
              <div
                style={{
                  fontSize: "32px",
                  color: "rgba(255, 255, 255, 0.9)",
                  marginBottom: "40px",
                  fontWeight: "500",
                }}
              >
                {subtitle}
              </div>
            )}

            {/* Stats */}
            {stats.length > 0 && (
              <div
                style={{
                  display: "flex",
                  gap: "24px",
                  marginTop: "32px",
                }}
              >
                {stats.map((stat, index) => (
                  <div
                    key={index}
                    style={{
                      background: "rgba(255, 255, 255, 0.15)",
                      backdropFilter: "blur(10px)",
                      padding: "16px 32px",
                      borderRadius: "16px",
                      fontSize: "24px",
                      fontWeight: "600",
                      color: "white",
                      border: "2px solid rgba(255, 255, 255, 0.3)",
                    }}
                  >
                    {stat}
                  </div>
                ))}
              </div>
            )}
          </div>

          {/* Footer */}
          <div
            style={{
              position: "absolute",
              bottom: "40px",
              display: "flex",
              alignItems: "center",
              gap: "16px",
              color: "white",
              fontSize: "24px",
              fontWeight: "600",
            }}
          >
            <div
              style={{
                width: "48px",
                height: "48px",
                background: "white",
                borderRadius: "12px",
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontSize: "32px",
              }}
            >
              🎓
            </div>
            <span>Best Engineering Colleges in India</span>
          </div>
        </div>
      ),
      {
        width: 1200,
        height: 630,
      }
    );
  } catch (error) {
    console.error("Error generating OG image:", error);
    return new Response("Failed to generate image", { status: 500 });
  }
}
