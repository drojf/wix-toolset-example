:: Please have Visual Studio 2017 Update 2 or newer installed
:: See https://github.com/microsoft/vswhere/wiki/Find-MSBuild

@echo off
setlocal enabledelayedexpansion

:: Tries to find and run msbuild using vswhere
:: Please note the /t:Rebuild flag which forces a (mostly) full rebuild each time
for /f "usebackq tokens=*" %%i in (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) do (
  "%%i" %* /t:Rebuild
  exit /b !errorlevel!
)
