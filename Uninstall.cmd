@echo off

echo Stopping tracker...
taskkill /F /IM "%LocalAppData%\PriesTracker\app\Tracker.exe" >nul 2>&1

echo Removing registry records...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\SCS Software\Euro Truck Simulator 2\Plugins" /v PriesTracker /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\SCS Software\American Truck Simulator\Plugins" /v PriesTracker /f >nul 2>&1

echo Deleting shortcuts...
del "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\PriesTracker.lnk" >nul 2>&1
rmdir /S /Q "%AppData%\Microsoft\Windows\Start Menu\Programs\Pries Logistics" >nul 2>&1

echo Deleting tracker files...
PowerShell -Command "Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('Tracker has been uninstalled successfully.')"
rmdir /S /Q "%LocalAppData%\PriesTracker" >nul 2>&1