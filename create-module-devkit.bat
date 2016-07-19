@echo off

setlocal

set "ModuleName=%~1"
set "ModuleDir=%~2"

call "%~dp0create-module.bat" /d "%ModuleName%" "%ModuleDir%" 

endlocal