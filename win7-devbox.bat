@echo off
rem ====================
rem Bootstrap the environment and install packages.
rem ====================
setlocal

call "%~dp0bootstrap.bat"
choco install "%~dp0packages-%~n0.config" /y 

endlocal