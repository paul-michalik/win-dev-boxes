@echo off
rem ====================
rem Run in new shells in order to ensure properly updated environments.
rem ====================
setlocal

start /wait "bootstrapping..." cmd /c call "%~dp0bootstrap.bat"
start /wait "choco-install packages-%~n0.config" cmd /c choco install "%~dp0packages-%~n0.config" /y 

endlocal