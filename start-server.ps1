# Startup script for the development server
# This updates PATH and starts the Next.js dev server

# Update PATH to include Node.js
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Change to project directory
Set-Location "C:\Users\chopr\OneDrive\Desktop\college project"

# Start the development server
Write-Host "Starting development server..." -ForegroundColor Green
Write-Host "Server will be available at: http://localhost:3000" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

npm run dev
