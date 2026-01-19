# Quick Start Guide

## Starting the Server

### Option 1: Use the Startup Script (Easiest)
1. Right-click on `start-server.ps1`
2. Select "Run with PowerShell"
3. Wait for "Ready" message
4. Open http://localhost:3000

### Option 2: Manual Start
1. Open PowerShell
2. Run these commands:
```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
cd "C:\Users\chopr\OneDrive\Desktop\college project"
npm run dev
```

### Option 3: Restart PowerShell
1. Close and reopen PowerShell (this refreshes PATH automatically)
2. Navigate to project:
```powershell
cd "C:\Users\chopr\OneDrive\Desktop\college project"
npm run dev
```

## Website Links

- **Home**: http://localhost:3000
- **Colleges**: http://localhost:3000/colleges
- **Compare**: http://localhost:3000/compare
- **AI Chat**: http://localhost:3000/chat

## Troubleshooting

**"npm is not recognized" error:**
- Restart PowerShell (closes and reopens)
- Or use the startup script: `start-server.ps1`

**Server won't start:**
- Make sure you're in the project folder
- Check that Node.js is installed: `node --version`
- Check that dependencies are installed: `npm install`

**Port 3000 already in use:**
- Stop any other servers using port 3000
- Or use a different port: `npm run dev -- -p 3001`

## Notes

- Keep the terminal window open while the server is running
- Press `Ctrl+C` to stop the server
- The server auto-reloads when you make code changes
