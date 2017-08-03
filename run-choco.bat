@echo off

rem ==============
rem Usage: 
rem run-choco.bat <choco-operation> <package-file-name>
rem ==============

setlocal
set "PackageList=packages-win7-devbox-host.txt"
set "ChocoOperation=%~1"
if /i not "%~2"=="" set "PackageList=%~2"
set "PackageList=%~dp0%PackageList%"

echo choco feature enable -n stopOnFirstPackageFailure 

for /f "tokens=*" %%f in (%PackageList%) do (
    echo choco %ChocoOperation% /y /d /v %%f
)

endlocal