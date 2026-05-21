@echo off
cd /d "%~dp0"
echo.
echo  Data Communication - Local Web Server
echo  ======================================
echo  After the server starts, open in your browser:
echo.
echo    http://localhost:5500/resources.html#video
echo.
echo  Press Ctrl+C to stop the server.
echo.

where py >nul 2>&1
if %errorlevel%==0 (
  start "" "http://localhost:5500/resources.html#video"
  py -m http.server 5500
  goto :end
)

where python >nul 2>&1
if %errorlevel%==0 (
  start "" "http://localhost:5500/resources.html#video"
  python -m http.server 5500
  goto :end
)

echo Python not found. Trying PowerShell server...
powershell -ExecutionPolicy Bypass -File "%~dp0start-server.ps1"
goto :end

:end
