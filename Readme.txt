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
Module creation helpers
=================

The script "create-module.bat" can be used to create a skeleton for a module or a module devkit. Usage:
create-module </d> <module-name> <module-directory>. If option /d is present as a first argument a devkit skeleton
is created. 
1. create-module.bat <module-name> <module-directory> -> creates a module under a specified directory, e.g.:
create-module.bat hello D:\Sources -> creates a module skeleton in D:\Sources\hello. 
2. create-module.bat <module-name> -> creates a module as %USERPROFILE%\<module-name>
3. create-module.bat -> creates a module as %USERPROFILE%\<automatically-generated-name>

Add /d if you wish to create skeleton for a devkit: create-module.bat /d hello D:\Sources -> creates a module devkit skeleton
in D:\Sources\hello.devkit. The usual usage pattern would be:
1. create-module.bat /d hello D:\Source = creates D:\Source\hello.devkit  
2. create-module.bat hello D:\Source\hello.devkit = creates D:\Source\hello.devkit\hello 
3. Create Git repository at D:\Source\hello.devkit\hello and push it to a Git remote server
4. Delete D:\Source\hello.devkit\hello
5. Create Git repository at D:\Source\hello.devkit
6. Add and initialize Git submodule hello inside hello.devkit using the previously pushed hello.git
7. Push D:\Source\hello.devkit to a Git remote server
