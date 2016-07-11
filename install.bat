@echo off

setlocal

start "install" cmd /k call "%~dp0run-choco.bat" install
endlocal