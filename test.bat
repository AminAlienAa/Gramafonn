@echo off
REM ============================================================
REM  Gramafon Android - auto-download the full native project
REM  Run this in an EMPTY folder (Windows 10/11)
REM ============================================================
setlocal enabledelayedexpansion

echo [1/6] Creating folders...
mkdir ".github\workflows" 2>nul
mkdir "app\src\main\java\com\gramafon\app" 2>nul
mkdir "app\src\main\res\values" 2>nul
mkdir "app\src\main\res\drawable" 2>nul
mkdir "app\src\main\res\mipmap-anydpi-v26" 2>nul

set B=https://d1qqeunc9izjbf.cloudfront.net/file-interaction

echo [2/6] Root files...
curl -sSL -o "settings.gradle"                    "%B%/bcecd657-settings.txt"
curl -sSL -o "build.gradle"                       "%B%/0d103d83-root-build.txt"
curl -sSL -o "gradle.properties"                 "%B%/234560e1-gradle.txt"
curl -sSL -o ".gitignore"                        "%B%/62dc0028-gitignore.txt"
curl -sSL -o "README.md"                         "%B%/110bbcf5-README.md"

echo [3/6] App module files...
curl -sSL -o "app\build.gradle"                  "%B%/1131e345-app-build.txt"
curl -sSL -o "app\src\main\AndroidManifest.xml"  "%B%/b8a83979-AndroidManifest.txt"

echo [4/6] Java code...
curl -sSL -o "app\src\main\java\com\gramafon\app\MainActivity.java" "%B%/ec57d55f-MainActivity.txt"

echo [5/6] Resources (incl. updated strings.xml with your host URL)...
curl -sSL -o "app\src\main\res\values\strings.xml" "%B%/807ef5bd-strings.txt"
curl -sSL -o "app\src\main\res\values\colors.xml"  "%B%/350b5c70-colors.txt"
curl -sSL -o "app\src\main\res\values\themes.xml"  "%B%/c0128e46-themes.txt"
curl -sSL -o "app\src\main\res\drawable\ic_launcher_foreground.xml" "%B%/871f4c9d-ic_launcher_foreground.txt"
curl -sSL -o "app\src\main\res\mipmap-anydpi-v26\ic_launcher.xml"   "%B%/365a183e-ic_launcher.txt"

echo [6/6] GitHub Actions workflow...
curl -sSL -o ".github\workflows\android-build.yml" "%B%/4b19e226-android-build.txt"

echo.
echo DONE! Project is ready in this folder.
echo Next steps:
echo   git init
echo   git add .
echo   git commit -m "Gramafon Android 1.0"
echo   git remote add origin https://github.com/USERNAME/REPO.git
echo   git push -u origin main
echo.
pause
