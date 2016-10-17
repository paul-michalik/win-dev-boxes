@echo off

setlocal

rem Shall create atomic module called "hi": 
call "%~dp0create-module.bat" hi > "%~dp0result.txt"
if %errorlevel% gtr 0 echo test 2 failed! & exit /b %errorlevel%
rd /s /q "%~dp0hi"
del "%~dp0result.txt"
if %errorlevel% gtr 0 echo test 2 cleanup failed! & exit /b %errorlevel%

rem Shall create atomic module called "hi": 
call "%~dp0create-module.bat" hi /a > "%~dp0result.txt"
if %errorlevel% gtr 0 echo test 3 failed! & exit /b %errorlevel%
rd /s /q "%~dp0hi"
del "%~dp0result.txt"
if %errorlevel% gtr 0 echo test 3 cleanup failed! & exit /b %errorlevel%

rem Shall create devkit module called "hi.devkit": 
call "%~dp0create-module.bat" hi /d > "%~dp0result.txt"
if %errorlevel% gtr 0 echo test 4 failed! & exit /b %errorlevel%
rd /s /q "%~dp0hi.devkit"
del "%~dp0result.txt"
if %errorlevel% gtr 0 echo test 4 cleanup failed! & exit /b %errorlevel%

rem Shall create test module called "hi": 
call "%~dp0create-module.bat" hi /t > "%~dp0result.txt"
if %errorlevel% gtr 0 echo test 5 failed! & exit /b %errorlevel%
rd /s /q "%~dp0hi"
del "%~dp0result.txt"
if %errorlevel% gtr 0 echo test 5 cleanup failed! & exit /b %errorlevel%

rem Shall create composite module called "hi": 
call "%~dp0create-module.bat" hi /c > "%~dp0result.txt"
if %errorlevel% gtr 0 echo test 6 failed! & exit /b %errorlevel%
rd /s /q "%~dp0hi"
del "%~dp0result.txt"
if %errorlevel% gtr 0 echo test 6 cleanup failed! & exit /b %errorlevel%

echo Test successful!

endlocal