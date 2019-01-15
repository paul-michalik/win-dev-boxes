# About this project
This project contains scripts to bootstrap virtual and physical Windows boxes aimnd specifically at software development scenarios. 

## How to use
1. Select the required use case: Choose Windows version (win7, win10, winserver-...) and scenario (devbox, devbox-host, cibox, ...). "host" variants are provisioned with tools required to act as hosts for virtualized or Dockerized boxes. "devbox" variants are provisioned with interactive development tools (Visual Studio, etc) and "cibox" variants has a bare minimum to run a build and tests. 
2. Right-mouse click the respective *.bat file and "run as administrator" or run "runas /user:Administrator win10-cibox.bat"

## Adding new box configurations

## Configure directly via Boxstarter Web App
|Click link to run  |Description  |
|---------|---------|
|<a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/paul-michalik/win-dev-boxes/tree/feature/switch-to-txt-based-configuration/win10-base-box.bat'> Paul's basic Windows development box</a> | **Windows Explorer settings:** Show Hidden Files and Folders, unused apps removed |

