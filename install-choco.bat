@echo off

setlocal

set "chocolateyUseWindowsCompression=1"
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

endlocal