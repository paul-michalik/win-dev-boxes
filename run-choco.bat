@echo off

rem ==============
rem Usage: 
rem run-choco.bat <choco-operation> <packages-or-package-config>
rem ==============

setlocal
set "PackageList="
set "ChocoOperation=%~1"
if /i not "%~2"=="" set "PackageList=%~2"

rem choco feature enable -n stopOnFirstPackageFailure 
choco upgrade chocolatey /y /d /v
choco install dotnet4.7 /y /d /v
choco %ChocoOperation% /y /d /v %PackageList%

endlocal