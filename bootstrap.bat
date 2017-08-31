@echo off
rem ====================
rem Install choco and upgrade all packages. 
rem ====================
rem Run in new shells in order to ensure properly updated environments. 
rem If Chocolatey is already installed effects should be benign.
rem ====================
setlocal

start "install-choco" /wait cmd /c powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"

start "choco-upgrade" /wait cmd /c choco upgrade all /y

endlocal