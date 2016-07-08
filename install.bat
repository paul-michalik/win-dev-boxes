@echo off

setlocal

set "Packages=%~dp0packages.txt"

for /f "tokens=*" %%f in (%Packages%) do (
    echo choco install %%f
)

endlocal