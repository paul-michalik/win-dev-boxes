@echo off

setlocal

set "SourceDir=%~dp0"
if %SourceDir:~-1%==\ set "SourceDir=%SourceDir:~0,-1%"

set "DestDir=\\ad.harman.com\global\Sites\Munich\Public\_User\PMichalik\win-dev-boxes"
if /i not "%~1"=="" set "DestDir=%~1"

robocopy "%SourceDir%" "%DestDir%" /s /xf *.VC.* /xd .git* .vs*

endlocal