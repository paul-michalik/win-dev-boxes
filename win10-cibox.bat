@echo off
rem ====================
rem Bootstrap the environment and install packages.
rem ====================
setlocal

call "%~dp0choco-install.bat" "%~dp0packages-%~n0.config" 

endlocal