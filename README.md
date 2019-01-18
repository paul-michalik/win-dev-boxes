# About this project
This project contains scripts to bootstrap virtual and physical Windows boxes aiming specifically at software development scenarios. 

## Initial configuration via Boxstarter WebLauncher App
|Click link to run  |Description  |
|---------|---------|
|<a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/paul-michalik/win-dev-boxes/feature/switch-to-txt-based-configuration/scripts/BasicBox.ps1'> Paul's basic Windows development box</a> | **Windows Explorer settings:** Show Hidden Files and Folders, unused apps removed |

## How to use
1. Select the required use case: Choose Windows version (win7, win10, winserver-...) and scenario (devbox, devbox-host, cibox, ...). "host" variants are provisioned with tools required to act as hosts for virtualized or Dockerized boxes (Hyper-V features, Vagrant, Docker for Windows). The "devbox" variants are provisioned with interactive development tools (Visual Studio, etc.) and "cibox" variants has a bare minimum to run a build and tests (CMake, Visual Studio Tools, etc.). 
2. In Windows Explorer: Drag and Drop the respective package configuration file onto ``packages-install.bat`` or ``packages-update.bat`` script.
3. In a console or from inside a script invoke ``packages-install <packages.txt>`` or ``packages-update <packages.txt>`` 

## Adding new box configurations
Simply add a new list of Chocolatey package names (with install or update arguments if required) in a new text file named following the pattern ``packages-<os version>-<scenario>.txt`` 

