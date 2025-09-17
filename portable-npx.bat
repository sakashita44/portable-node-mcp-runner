@echo off
REM portable-npx.bat - ensure portable node is on PATH and invoke npx.cmd with forwarded args
SETLOCAL ENABLEDELAYEDEXPANSION

REM Determine script directory
SET "SCRIPT_DIR=%~dp0"
REM Remove trailing backslash if present
IF "%SCRIPT_DIR:~-1%"=="\" SET "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

REM Node and npm locations inside portable layout
SET "NODE_DIR=%SCRIPT_DIR%\node-v22.19.0-win-x64"
SET "NPM_BIN=%NODE_DIR%\node_modules\.bin"

REM Export PATH so node and local bins are found
SET "PATH=%NODE_DIR%;%NPM_BIN%;%PATH%"

REM Configure npm cache/prefix to writable locations under portable node
SET "npm_config_cache=%NODE_DIR%\npm-cache"
SET "npm_config_prefix=%NODE_DIR%\npm-global"

REM Diagnostic log to stderr for debugging
echo portable-npx.bat: SCRIPT_DIR=%SCRIPT_DIR% 1>&2
echo portable-npx.bat: NODE_DIR=%NODE_DIR% 1>&2
echo portable-npx.bat: PATH=%PATH% 1>&2

REM Call npx.cmd with forwarded args
"%NODE_DIR%\npx.cmd" %*

EXIT /B %ERRORLEVEL%
