@echo off

setlocal

set "ModuleUsage="
set "ModuleIsDevkit="
set "ModuleIsComposite="
set "ModuleIsAtomic="
set "ModuleIsTest="
set "ModuleName="
set "ModuleDir=%CD%"
set "ModuleTemplatesDir=%~dp0module-templates"

if /i "%~1"=="/?" (
    call :PrintUsage
    goto :eof
)

call :ParseCmdArgs %*
if %errorlevel% gtr 0 echo Wrong command line parameters. Usage: & echo. & call :PrintUsage & exit /b %errorlevel%

call :GetModuleNameAndDir
if %errorlevel% gtr 0 echo Could not determine module name and folder. & exit /b %errorlevel%

call :CreateModuleDir
if %errorlevel% gtr 0 echo Could not create module folder. & exit /b %errorlevel%

call :PopulateModuleDir
if %errorlevel% gtr 0 echo Could not populate module folder. & exit /b %errorlevel%

rem ==========
rem Procedures
rem ==========

goto :eof

:ParseCmdArgs

    if /i "%~1"=="" goto :Args0
    if /i "%~2"=="" goto :Args1
    if /i "%~3"=="" goto :Args2

    rem illegal, wrong number of arguments
    exit /b 1  
:Args0
    rem 0 args: illegal
    exit /b 1
:Args1
    rem 1 args: module-name
    set "ModuleName=%~1"
    set "ModuleIsAtomic=/a"
    
    exit /b %errorlevel%
:Args2
    rem 2 args: module-name module-type
    set "ModuleName=%~1"

    if /i "%~2"=="/a" (
        set "ModuleIsAtomic=%~2"
    ) else (
        if /i "%~2"=="/t" (
            set "ModuleIsTest=%~2"
        ) else (
            if /i "%~2"=="/d" (
                set "ModuleIsDevkit=%~2"
            ) else (
                if /i "%~2"=="/c" (
                    set "ModuleIsComposite=%~2"
                ) else (
                    call :PrintUsage
                    exit /b 1
                )
            )
        )
    )
    exit /b %errorlevel%
exit /b %errorlevel%

:GetModuleNameAndDir
    set "ModuleDir=%ModuleDir%\%ModuleName%"

    rem Replace illegal or locale dependent characters in module name:
    set "ModuleName=%ModuleName: =-%"
    set "ModuleName=%ModuleName::=-%"
    set "ModuleName=%ModuleName:/=-%"
    set "ModuleName=%ModuleName:\=-%"
    set "ModuleName=%ModuleName:.=-%"
    set "ModuleName=%ModuleName:,=-%"

    if /i "%ModuleIsDevkit%"=="/d" (
        set "ModuleDir=%ModuleDir%.devkit"
    )
exit /b %errorlevel%

:CreateModuleDir
    md "%ModuleDir%"
exit /b %errorlevel%

:PopulateModuleDir
    xcopy "%ModuleTemplatesDir%\.git*" "%ModuleDir%\" /y /i
    if %errorlevel% gtr 0 exit %errorlevel%
     
    echo %0

    if /i "%ModuleIsDevkit%"=="/d" (
        call :CreateFileItem "%ModuleTemplatesDir%\CMakeLists-devkit.txt" "%ModuleDir%\CMakeLists.txt"
        if %errorlevel% gtr 0 exit %errorlevel%
    )

    if /i "%ModuleIsAtomic%"=="/a" (
        call :CreateFileItem "%ModuleTemplatesDir%\CMakeLists-src.txt" "%ModuleDir%\CMakeLists.txt"
        if %errorlevel% gtr 0 exit %errorlevel%

        call :CreateFileItem "%ModuleTemplatesDir%\[module-name].h" "%ModuleDir%\%ModuleName%.h"
        if %errorlevel% gtr 0 exit %errorlevel%

        md "%ModuleDir%\src"
        if %errorlevel% gtr 0 exit %errorlevel%

        call :CreateFileItem "%ModuleTemplatesDir%\[module-name].cpp" "%ModuleDir%\src\%ModuleName%.cpp"
        if %errorlevel% gtr 0 exit %errorlevel%
    )

    if /i "%ModuleIsComposite%"=="/c" (
        call :CreateFileItem "%ModuleTemplatesDir%\CMakeLists-composite.txt" "%ModuleDir%\CMakeLists.txt"

        call :CreateFileItem "%ModuleTemplatesDir%\[module-name].h" "%ModuleDir%\%ModuleName%.h"
        if %errorlevel% gtr 0 exit %errorlevel%

        md "%ModuleDir%\src"
        if %errorlevel% gtr 0 exit %errorlevel%

        call :CreateFileItem "%ModuleTemplatesDir%\[module-name].cpp" "%ModuleDir%\src\%ModuleName%.cpp"
        if %errorlevel% gtr 0 exit %errorlevel%
    )

    if /i "%ModuleIsTest%"=="/t" (
        call :CreateFileItem "%ModuleTemplatesDir%\CMakeLists-tests.txt" "%ModuleDir%\CMakeLists.txt"

        md "%ModuleDir%\boost"
        if %errorlevel% gtr 0 exit %errorlevel%

        call :CreateFileItem "%ModuleTemplatesDir%\[module-name]_tests.cpp" "%ModuleDir%\boost\%ModuleName%_test.cpp"
        if %errorlevel% gtr 0 exit %errorlevel%
    )

exit /b %errorlevel%

:PrintUsage
    echo Creates a skeleton for a module with default entries in current folder
    echo.
    echo create-module.bat module-name [/d] [/a] [/c] [/t]
    echo.    module-name
    echo.        Specify the name of the module. Shall contain characters which consitute a valid folder name.
    echo.    /d Module will be devkit.
    echo.    /a Module will be atomic source code module (default)
    echo.    /c Module will be composite module
    echo.    /t Module will be unit test module (boost)
exit /b errorlevel

:CreateFileItem
setlocal enableDelayedExpansion
    rem 
    rem Replace the placeholder "[module-name]" with real module name while preserving formatting!
    rem
    set "Source=%~1"
    set "Target=%~2" 

    echo Source=%Source% & echo Target=%Target%
 
    call "%~dp0replace-string-in-file.bat" "[module-name]" "%ModuleName%" "%Source%" >> "%Target%"
endlocal
exit /b %errorlevel%
    
exit /b %errorlevel

endlocal