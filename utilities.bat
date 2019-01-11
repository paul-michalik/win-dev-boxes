@echo off
rem ====================
rem Bootstrap the environment and install packages.
rem ====================
setlocal

call "%~dp0choco-run-command.bat" "%~dp0packages-%~n0.txt" install

endlocal
