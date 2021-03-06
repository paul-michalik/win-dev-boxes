@echo off
rem ====================
rem Deploy all relevant scripts to specified environment
rem ====================
setlocal

set "SourceDir=%~dp0"
if %SourceDir:~-1%==\ set "SourceDir=%SourceDir:~0,-1%"

rem set "DestDir=\\ad.harman.com\global\Sites\Munich\Public\_User\PMichalik\win-dev-boxes"
set "DestDir=C:\Users\IEUser\Documents\win-dev-boxes"
if /i not "%~1"=="" set "DestDir=%~1"
if exist "%DestDir%" rd /s /q "%DestDir%"

robocopy "%SourceDir%" "%DestDir%" /s /xf *.VC.* *.git* /xd .git* .vs*

endlocal