@echo off
rem ====================
rem Install choco and upgrade all packages. 
rem ====================

call "%~dp0choco-bootstrap.bat"
 
choco upgrade %* /y

call RefreshEnv