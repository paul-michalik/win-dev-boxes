=================
Package management
=================

Bootstrapper scripts for chocolatey https://chocolatey.org/ package manager + development tooling. Targets are Windows 7 machines as used at Harman around July 2016. We will use chocolatey as a package manager until Harman won't let us upgrade to Windows 10 which has native package manager included out of the box. After an upgrade to Windows 10 this procedure should be ported. The basic workflow is as with any package manager (think of apt-get for Debian based Linuxes): Install, upgrade and uninstall software packages via scripting. The next stage of this using VMs images with predefined installation scripts so that a fully automated workflow will be supported. 

1. Edit packages.txt. Add or remove packages as required. packages.txt contains a new-line separated list of chocolatey packages which are considered a basic equipment of a developer machine. There are few shortcut scripts intended to ease the usage but of course you can use the chcoco command line or the Chocolatey GUI app (= https://chocolatey.org/packages/ChocolateyGUI) directly. 
2. Install Chocolatey: Right-mouse click on "install-choco" and "run as administrator"
3. Option (a): Right-mouse click on "install" and "run as administrator"
   Option (b): Start cmd.exe "as an administrator" from the start menu and run "install". The set
   Option (c): Use chocolatey directly from a "administrator command prompt". Open cmd.exe "as administrator" and "choco" should be available. Please refer to https://chocolatey.org/docs for more information and https://chocolatey.org/docs/commands-reference for full command reference.

=================
Shortcut scripts
=================

"install" - installs chcolatey and all packages listed in packages.txt (*). Always run the script with elevated provileges = "run as administrator". 

"upgrade" - upgrades chcolatey and all packages listed in packages.txt

"uninstall" - uninstalls all packages listed in packages.txt

=================
Project creation script
=================

The script "create-project.bat" can be used to create a skeleton for a module project.
1. create-project.bat <project-name> <project-directory> -> creates a project under a specified directory, e.g.:
create-project.bat hello D:\Sources -> creates a project skeleton in D:\Sources\hello. 
2. create-project.bat <project-name> -> creates a project as %USERPROFILE%\<project-name>
3. create-project.bat -> creates a project as %USERPROFILE%\<automatically-generated-name>
All other invokation patterns are an error.
