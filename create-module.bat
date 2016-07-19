@echo off

rem
rem %1   
rem %2
rem %3
rem %4
rem

setlocal

set "ModuleIsDevkit="
set "ModuleName="
set "ModuleDir="
set "ModuleTemplatesDir=module-templates"

call :ParseCmdArgs %*
if %errorlevel% gtr 0 start "Error" echo Wrong number of arguments. & exit /b %errorlevel%

call :GetModuleNameAndDir
if %errorlevel% gtr 0 start "Error" echo Could not determine module name and location for %ModuleName%. & exit /b %errorlevel%

call :CreateModuleDir
if %errorlevel% gtr 0 start "Error" echo Could not create module folder: %ModuleDir% & exit /b %errorlevel%

call :PopulateModuleDir
if %errorlevel% gtr 0 start "Error" echo Could not populate module folder: %ModuleDir% & exit /b %errorlevel%

call :RewriteCMakeLists
if %errorlevel% gtr 0 start "Error" echo Could not generate %ModuleDir%\CMakeLists.txt & exit /b %errorlevel%

rem ==========
rem Procedures
rem ==========

goto :eof

:ParseCmdArgs
    if /i "%~1"=="" goto :Args0
    if /i "%~2"=="" goto :Args1
    if /i "%~3"=="" goto :Args2
    if /i "%~4"=="" goto :Args3

    rem illegal, wrong number of arguments

    exit /b 1  
:Args0
    rem 0 args, module is not a devkit 
    exit /b %errorlevel%
:Args1
    rem 1 args, module is either a devkit or name of the project
    if /i "%~1"=="/d" (
        set "ModuleIsDevkit=%~1"
    ) else (
        set "ModuleName=%~1"
    )
    exit /b %errorlevel%
:Args2
    rem 2 args, module is either a devkit or name of the project, or project directory
    if /i "%~1"=="/d" (
        set "ModuleIsDevkit=%~1"
        set "ModuleName=%~2"
    ) else (
        set "ModuleName=%~1"
        set "ModuleDir=%~2"
    )
    exit /b %errorlevel%
:Args3
    rem 3 args, module is a devkit, name of the project, project directory
    set "ModuleIsDevkit=%~1"
    if /i not "%~1"=="/d" exit /b 1
    set "ModuleName=%~2"
    set "ModuleDir=%~3"
    exit /b %errorlevel%
exit /b %errorlevel%

:GetModuleNameAndDir
    if /i "%ModuleName%"=="" set "ModuleName=[module-name]-%date%-%time%"

    rem Replace illegal or locale dependent characters in module name:
    set ModuleName=%ModuleName: =-%
    set ModuleName=%ModuleName::=-%
    set ModuleName=%ModuleName:/=-%
    set ModuleName=%ModuleName:.=-%
    set ModuleName=%ModuleName:,=-%

    if /i "%ModuleDir%"=="" set "ModuleDir=%USERPROFILE%"
    set "ModuleDir=%ModuleDir%\%ModuleName%"

    if /i "%ModuleIsDevkit%"=="/d" (
        set "ModuleDir=%ModuleDir%.devkit"
    )
exit /b %errorlevel%

:CreateModuleDir
    md "%ModuleDir%"
exit /b %errorlevel%

:PopulateModuleDir
    xcopy "%~dp0%ModuleTemplatesDir%\.git*" "%ModuleDir%\" /y /i
    if %errorlevel% gtr 0 exit %errorlevel%

    xcopy "%~dp0%ModuleTemplatesDir%\[module-name]_build_info.txt" "%ModuleDir%\custom_build\%ModuleName%_build_info.txt*" /y
    if %errorlevel% gtr 0 exit %errorlevel%
     
    if /i not "%ModuleIsDevkit%"=="/d" (
        xcopy "%~dp0%ModuleTemplatesDir%\[module-name].h" "%ModuleDir%\%ModuleName%.h*" /y
        if %errorlevel% gtr 0 exit %errorlevel%

        xcopy "%~dp0%ModuleTemplatesDir%\[module-name].cpp" "%ModuleDir%\src\%ModuleName%.cpp*" /y
        if %errorlevel% gtr 0 exit %errorlevel%

        xcopy "%~dp0%ModuleTemplatesDir%\[module-name]_tests.cpp" "%ModuleDir%\tests\%ModuleName%_tests.cpp*" /y
        if %errorlevel% gtr 0 exit %errorlevel%
    )
exit /b %errorlevel%

:RewriteCMakeLists
setlocal enableDelayedExpansion
    rem 
    rem Replace the placeholder "[module-name]" with real module name while preserving formatting!
    rem
    
    set "CMakeListsTemplate="
    if /i "%ModuleIsDevkit%"=="/d" (
        set "CMakeListsTemplate=%~dp0%ModuleTemplatesDir%%\CMakeLists-devkit.txt"
    ) else (
        set "CMakeListsTemplate=%~dp0%ModuleTemplatesDir%%\CMakeLists.txt"
    )

    for /f "tokens=1* delims=]" %%f in ('find /v /n "" "%CMakeListsTemplate%"') do (
        set "OldLine=%%g"
        if /i "!OldLine!"=="" (
            echo. >> "%ModuleDir%\CMakeLists.txt"
        ) else (
            rem replace [module-name] token
            set "NewLine=!OldLine:[module-name]=%ModuleName%!"
            
            rem if after removing whitespaces the line is empty, just output an empty line
            set "NewLineWithoutWhitespaces=!NewLine: =!"
            if /i not "!NewLineWithoutWhitespaces!"=="" (
                echo !NewLine! >> "%ModuleDir%\CMakeLists.txt"
            ) else (
                echo. >> "%ModuleDir%\CMakeLists.txt"
            )
        )
    )
endlocal
exit /b %errorlevel%
    
exit /b %errorlevel

endlocal