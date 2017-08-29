@echo off

setlocal
call "%~dp0install-choco.bat"
choco upgrade all /y
choco install "%~dp0packages-%~n0.config" /y 

endlocal