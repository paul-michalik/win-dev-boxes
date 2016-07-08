@echo off

setlocal

set "SourceDir=%~dp0"
if %SourceDir:~-1%==\ set "SourceDir=%SourceDir:~0,-1%"
set "DestDir=\\hbi.ad.harman.com\munich\Public\_User\PMichalik\devenv.devkit"

robocopy "%SourceDir%" "%DestDir%" *.bat Readme.txt packages.txt

endlocal