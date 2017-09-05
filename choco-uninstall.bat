@echo off

rem Uninstall all packages:
choco uninstall all /y

copy /y "%ProgramData%\Chocolatey\bin\RefreshEnv.cmd" "%TEMP%\RefreshEnv.cmd"
call RefreshEnv

echo Cleaning up registry...
rem Remove everything related to Chocolatey. Source: https://chocolatey.org/docs/uninstallation
powershell.exe -NoProfile -ExecutionPolicy Bypass -command "%~dp0choco-uninstall.ps1" %*

call "%TEMP%\RefreshEnv.cmd"

del /q "%TEMP%\RefreshEnv.cmd"