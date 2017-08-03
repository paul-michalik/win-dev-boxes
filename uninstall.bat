@echo off

setlocal

start "uninstall" cmd /k call "%~dp0run-choco.bat" uninstall %*

endlocal