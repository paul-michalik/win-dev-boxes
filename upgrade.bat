@echo off

setlocal

start "upgrade" cmd /k call "%~dp0run-choco.bat" upgrade
endlocal