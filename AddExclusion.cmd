@echo off
echo Adding exclusion. Please wait...
powershell -Command Add-MpPreference -ExclusionPath "%USERPROFILE%\AppData\Local\PriesTracker\app"