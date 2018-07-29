@echo off
rem ====================
rem Install packages from a text file passed on input 
rem ====================

call "%~dp0choco-bootstrap.bat"
 
for /F "usebackq tokens=*" %%L in ("%~1") do (
    choco install %%L /y
    call RefreshEnv
)