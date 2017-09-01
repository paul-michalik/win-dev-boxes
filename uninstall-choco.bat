@echo off
setlocal

rem Uninstall all packages:
choco uninstall all /y /x

refreshenv

rem Remove verything related to Chocolatey. Source: https://chocolatey.org/docs/uninstallation
powershell.exe -NoProfile -ExecutionPolicy Bypass -command "%~dp0uninstall-choco.ps1" %*

endlocal