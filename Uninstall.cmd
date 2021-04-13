@echo off

set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

echo Stopping tracker...
taskkill /F /IM Tracker.exe >nul 2>&1

echo Removing registry records...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\SCS Software\Euro Truck Simulator 2\Plugins" /v PriesTracker /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\SCS Software\American Truck Simulator\Plugins" /v PriesTracker /f >nul 2>&1

echo Deleting shortcuts...
del "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\PriesTracker.lnk" >nul 2>&1
rmdir /S /Q "%AppData%\Microsoft\Windows\Start Menu\Programs\Pries Logistics" >nul 2>&1

echo Deleting tracker files...
PowerShell -Command "Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('Tracker has been uninstalled successfully.')"
rmdir /S /Q "%LocalAppData%\PriesTracker" >nul 2>&1