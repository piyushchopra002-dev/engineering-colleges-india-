"use client";

import { useEffect, useMemo, useRef, useState } from "react";

interface CollegeOption {
  id: string;
  name: string;
  slug: string;
}

interface LogoUploaderProps {
  colleges: CollegeOption[];
}

export function LogoUploader({ colleges }: LogoUploaderProps) {
  const [selectedId, setSelectedId] = useState(colleges[0]?.id || "");
  const [logoFile, setLogoFile] = useState<File | null>(null);
  const [coverFile, setCoverFile] = useState<File | null>(null);
  const [status, setStatus] = useState<"idle" | "uploading" | "success" | "error">("idle");
  const [message, setMessage] = useState("");
  const [isDragging, setIsDragging] = useState(false);
  const [activeTarget, setActiveTarget] = useState<"logo" | "cover">("cover");
  const inputRef = useRef<HTMLInputElement | null>(null);
  const coverInputRef = useRef<HTMLInputElement | null>(null);

  const selectedCollege = useMemo(
    () => colleges.find((c) => c.id === selectedId),
    [colleges, selectedId]
  );
  const selectedIndex = useMemo(
    () => colleges.findIndex((c) => c.id === selectedId),
    [colleges, selectedId]
  );

  const handleUpload = async (type: "logo" | "cover") => {
    if (!selectedCollege) return;
    const file = type === "logo" ? logoFile : coverFile;
    if (!file) return;
    setStatus("uploading");
    setMessage("");

    try {
      const formData = new FormData();
      formData.append("file", file);
      formData.append("collegeId", selectedCollege.id);
      formData.append("slug", selectedCollege.slug);

      const response = await fetch(
        type === "logo" ? "/api/admin/upload-logo" : "/api/admin/upload-cover",
        {
        method: "POST",
        body: formData,
        }
      );

      if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        throw new Error(errorData.error || "Upload failed");
      }

      const data = await response.json();
      setStatus("success");
      setMessage(
        `${type === "logo" ? "Logo" : "Cover"} uploaded. Public URL: ${data.url}`
      );
      if (type === "logo") {
        setLogoFile(null);
      } else {
        setCoverFile(null);
      }
      if (selectedIndex >= 0 && selectedIndex < colleges.length - 1) {
        setSelectedId(colleges[selectedIndex + 1].id);
        setStatus("idle");
        setMessage("");
      }
    } catch (error: any) {
      setStatus("error");
      setMessage(error?.message || "Upload failed");
    }
  };

  const handleFiles = (files: FileList | null) => {
    const nextFile = files?.[0] || null;
    if (activeTarget === "logo") {
      setLogoFile(nextFile);
    } else {
      setCoverFile(nextFile);
    }
    setStatus("idle");
    setMessage("");
  };

  useEffect(() => {
    const onPaste = (event: ClipboardEvent) => {
      const items = event.clipboardData?.items || [];
      const imageItem = Array.from(items).find((item) => item.type.startsWith("image/"));
      if (!imageItem) return;
      const pastedFile = imageItem.getAsFile();
      if (pastedFile) {
        setCoverFile(pastedFile);
        setActiveTarget("cover");
        setStatus("idle");
        setMessage("");
      }
    };
    window.addEventListener("paste", onPaste);
    return () => window.removeEventListener("paste", onPaste);
  }, []);

  return (
    <div className="bg-white rounded-lg shadow-md p-6 space-y-4">
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Select College</label>
        <select
          value={selectedId}
          onChange={(e) => setSelectedId(e.target.value)}
          className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500"
        >
          {colleges.map((college) => (
            <option key={college.id} value={college.id}>
              {college.name}
            </option>
          ))}
        </select>
      </div>

      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Upload Logo</label>
        <div
          onDragOver={(e) => {
            e.preventDefault();
            setIsDragging(true);
            setActiveTarget("logo");
          }}
          onDragLeave={() => setIsDragging(false)}
          onDrop={(e) => {
            e.preventDefault();
            setIsDragging(false);
            setActiveTarget("logo");
            handleFiles(e.dataTransfer.files);
          }}
          className={`border-2 border-dashed rounded-lg p-4 text-sm text-gray-600 ${
            isDragging ? "border-primary-500 bg-primary-50" : "border-gray-300"
          }`}
          onClick={() => setActiveTarget("logo")}
        >
          <div className="flex items-center justify-between gap-4">
            <span>
              {logoFile
                ? logoFile.name
                : "Drag & drop a logo here, paste, or choose a file"}
            </span>
            <button
              type="button"
              onClick={() => inputRef.current?.click()}
              className="px-3 py-2 rounded-lg bg-primary-600 text-white text-sm"
            >
              Choose file
            </button>
          </div>
        </div>
        <input
          ref={inputRef}
          type="file"
          accept="image/*"
          onChange={(e) => {
            setActiveTarget("logo");
            handleFiles(e.target.files);
          }}
          className="hidden"
        />
        <button
          onClick={() => handleUpload("logo")}
          disabled={!selectedCollege || !logoFile || status === "uploading"}
          className="mt-3 px-4 py-2 bg-primary-600 text-white rounded-lg disabled:opacity-50"
        >
          {status === "uploading" ? "Uploading..." : "Upload Logo"}
        </button>
      </div>

      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">
          Upload Building Cover
        </label>
        <div
          onDragOver={(e) => {
            e.preventDefault();
            setIsDragging(true);
            setActiveTarget("cover");
          }}
          onDragLeave={() => setIsDragging(false)}
          onDrop={(e) => {
            e.preventDefault();
            setIsDragging(false);
            setActiveTarget("cover");
            handleFiles(e.dataTransfer.files);
          }}
          className={`border-2 border-dashed rounded-lg p-4 text-sm text-gray-600 ${
            isDragging ? "border-primary-500 bg-primary-50" : "border-gray-300"
          }`}
          onClick={() => setActiveTarget("cover")}
        >
          <div className="flex items-center justify-between gap-4">
            <span>
              {coverFile
                ? coverFile.name
                : "Drag & drop a building photo here, paste, or choose a file"}
            </span>
            <button
              type="button"
              onClick={() => coverInputRef.current?.click()}
              className="px-3 py-2 rounded-lg bg-primary-600 text-white text-sm"
            >
              Choose file
            </button>
          </div>
        </div>
        <input
          ref={coverInputRef}
          type="file"
          accept="image/*"
          onChange={(e) => {
            setActiveTarget("cover");
            handleFiles(e.target.files);
          }}
          className="hidden"
        />
        <button
          onClick={() => handleUpload("cover")}
          disabled={!selectedCollege || !coverFile || status === "uploading"}
          className="mt-3 px-4 py-2 bg-primary-600 text-white rounded-lg disabled:opacity-50"
        >
          {status === "uploading" ? "Uploading..." : "Upload Building Photo"}
        </button>
        <div className="text-xs text-gray-500 mt-2">Recommended size: 1600×900</div>
      </div>

      {message && (
        <div
          className={`text-sm ${
            status === "error" ? "text-red-600" : "text-green-600"
          }`}
        >
          {message}
        </div>
      )}
    </div>
  );
}
