@echo off
rem ====================
rem Run choco command (install, upgrade, uninstall) for packages from a text file passed on input. Invocation examples:
rem choco-run install utilities.txt
rem choco-run upgrade utilities.txt
rem choco-run delete utilities.txt
rem ====================

call "%~dp0choco-bootstrap.bat"
 
for /F "usebackq tokens=*" %%L in ("%~1") do (
    choco %~2 %%L /y
    call RefreshEnv
)
