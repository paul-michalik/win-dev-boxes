@echo off

setlocal

set "Packages=%~dp0packages.txt"

for /f %%f in ("%Packages%") do (
    echo choco install %%f
)

endlocal