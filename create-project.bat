@echo off

setlocal

set "ProjectName=%~1"
set "ProjectDir=%~2"
set "ProjectTemplatesDir=project-templates"

call :GetProjectNameAndDir
if %errorlevel% gtr 0 start "Error" echo Could not determine project location for %ProjectDir%. & exit /b %errorlevel%

call :CreateProjectDir
if %errorlevel% gtr 0 start "Error" echo Could not create project folder: %ProjectDir% & exit /b %errorlevel%

call :PopulateProjectDir
if %errorlevel% gtr 0 start "Error" echo Could not populate project folder: %ProjectDir% & exit /b %errorlevel%

call :RewriteCMakeLists
if %errorlevel% gtr 0 start "Error" echo Could not generate %ProjectDir%\CMakeLists.txt & exit /b %errorlevel%

rem ==========
rem Procedures
rem ==========

goto :eof

:GetProjectNameAndDir
    if /i "%ProjectName%"=="" set "ProjectName=[project-name]-%date%-%time%"
    rem Replace illegal or locale dependent characters in project name:
    set ProjectName=%ProjectName: =-%
    set ProjectName=%ProjectName::=-%
    set ProjectName=%ProjectName:/=-%
    set ProjectName=%ProjectName:.=-%
    set ProjectName=%ProjectName:,=-%
    if /i "%ProjectDir%"=="" set "ProjectDir=%USERPROFILE%"
    set "ProjectDir=%ProjectDir%\%ProjectName%"
exit /b %errorlevel%

:CreateProjectDir
    md "%ProjectDir%"
exit /b %errorlevel%

:PopulateProjectDir
    md "%ProjectDir%\build"
    if %errorlevel% gtr 0 exit %errorlevel%

    md "%ProjectDir%\src"
    if %errorlevel% gtr 0 exit %errorlevel%

    md "%ProjectDir%\tests"
    if %errorlevel% gtr 0 exit %errorlevel%

    xcopy "%~dp0%ProjectTemplatesDir%\.git*" "%ProjectDir%\" /y /i
    if %errorlevel% gtr 0 exit %errorlevel%
     
    xcopy "%~dp0%ProjectTemplatesDir%\[project-name].h" "%ProjectDir%\%ProjectName%.h*" /y
    if %errorlevel% gtr 0 exit %errorlevel%

    xcopy "%~dp0%ProjectTemplatesDir%\[project-name].cpp" "%ProjectDir%\src\%ProjectName%.cpp*" /y
    if %errorlevel% gtr 0 exit %errorlevel%
exit /b %errorlevel%

:RewriteCMakeLists
setlocal enableDelayedExpansion
    rem 
    rem Replace the placeholder "[project-name]" with real project name while preserving formatting!
    rem 
    for /f "tokens=1* delims=]" %%f in ('find /v /n "" "%~dp0%ProjectTemplatesDir%%\CMakeLists.txt"') do (
        set "OldLine=%%g"
        if /i "!OldLine!"=="" (
            echo. >> "%ProjectDir%\CMakeLists.txt"
        ) else (
            set "NewLine=!OldLine:[project-name]=%ProjectName%!"
            echo !NewLine! >> "%ProjectDir%\CMakeLists.txt"
        )
    )
endlocal
exit /b %errorlevel%
    
exit /b %errorlevel

endlocal