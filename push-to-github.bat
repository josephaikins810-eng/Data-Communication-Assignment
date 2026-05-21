@echo off
cd /d "%~dp0"
echo.
echo  Push Data Communication assignment to GitHub
echo  =============================================
echo.

where git >nul 2>&1
if %errorlevel% neq 0 (
  echo ERROR: Git is not installed.
  echo Download: https://git-scm.com/download/win
  echo Then run this file again.
  pause
  exit /b 1
)

echo Step 1: Create repo on GitHub first if you have not:
echo   https://github.com/new?name=data-communication
echo.
pause

if not exist ".git" (
  git init
  git add .
  git commit -m "Data Communication assignment website"
  git branch -M main
)

git remote remove origin 2>nul
git remote add origin https://github.com/josephaikins810-eng/data-communication.git

echo.
echo Pushing to GitHub...
git push -u origin main

if %errorlevel%==0 (
  echo.
  echo SUCCESS! Your repo should be live at:
  echo   https://github.com/josephaikins810-eng/data-communication
  echo.
  echo Enable GitHub Pages in repo Settings -^> Pages -^> branch main
) else (
  echo.
  echo Push failed. Check:
  echo   - Repo exists on GitHub under your account
  echo   - Username in push-to-github.bat matches your GitHub login
  echo   - You are signed in to Git
)

echo.
pause
