@echo off

setlocal

set "Packages=%~dp0packages.txt"
set "Option=%~1"

for /f "tokens=*" %%f in (%Packages%) do (
    choco %Option% /y /d /v %%f
)

endlocal