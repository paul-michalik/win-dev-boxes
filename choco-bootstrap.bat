@echo off
rem ====================
rem Install choco and upgrade all packages. 
rem ====================

if not exist "%ProgramData%\Chocolatey\choco.exe" (
    echo Bootstrapping chocolatey...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
) else (
    echo found "%ProgramData%\Chocolatey\choco.exe"...
)

call "%ProgramData%\chocolatey\bin\RefreshEnv

choco upgrade all /y

call RefreshEnv