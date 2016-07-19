@echo off

setlocal

set "ModuleName=%~1"
set "ModuleDir=%~2"
set "ModuleTemplatesDir=module-devkit-templates"

call "%~dp0create-module.bat" /d "%ModuleName%" "%ModuleDir%" 

endlocal