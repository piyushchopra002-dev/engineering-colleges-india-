# Troubleshooting Guide - Connection Refused

## Server is Running But Can't Connect?

### Quick Fixes:

1. **Try these URLs:**
   - http://127.0.0.1:3000 (instead of localhost)
   - http://localhost:3000
   - http://[::1]:3000

2. **Check Firewall:**
   - Windows might be blocking Node.js
   - Go to Windows Defender Firewall → Allow an app
   - Make sure Node.js is allowed

3. **Clear Browser Cache:**
   - Press Ctrl + Shift + Delete
   - Clear cache and cookies
   - Try again

4. **Try Different Browser:**
   - If using Opera, try Chrome or Edge
   - Sometimes browsers have proxy settings

5. **Check Proxy Settings:**
   - In Opera: Settings → Advanced → System → Proxy
   - Make sure "Use a proxy server" is OFF

6. **Restart Server:**
   - Close the terminal running `npm run dev`
   - Open new terminal
   - Run: `cd "C:\Users\chopr\OneDrive\Desktop\college project"`
   - Run: `npm run dev`
   - Wait for "Ready" message

7. **Check Port:**
   - Make sure nothing else is using port 3000
   - If needed, change port: `npm run dev -- -p 3001`
   - Then use: http://localhost:3001

### Still Not Working?

Check the terminal where `npm run dev` is running:
- Look for error messages (red text)
- Share any errors you see
- Make sure it says "Ready" or "Compiled successfully"

### Alternative: Use IP Address

Try: http://127.0.0.1:3000 instead of localhost
