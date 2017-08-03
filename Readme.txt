=================
Rationale
=================

Scripts to set up or bootstrp virtual and physical Windows development or CI/CD boxes.

1. Edit packages.txt. Add or remove packages as required. packages.txt contains a new-line separated list of chocolatey 
packages which are considered a basic equipment of a developer machine. There are few shortcut scripts intended to ease 
the usage but of course you can use the chcoco command line or the Chocolatey GUI app (= https://chocolatey.org/packages/ChocolateyGUI) directly. 
2. Install Chocolatey: Right-mouse click on "install-choco" and "run as administrator"
3. Option (a): Right-mouse click on "install" and "run as administrator"
   Option (b): Start cmd.exe "as an administrator" from the start menu and run "install". The set
   Option (c): Use chocolatey directly from a "administrator command prompt". Open cmd.exe "as administrator" and "choco" 
   should be available. Please refer to https://chocolatey.org/docs for more 
   information and https://chocolatey.org/docs/commands-reference for full command reference.

=================
Shortcut scripts
=================

"install" - install chcolatey and all packages listed in packages.txt (*). Always run the script with elevated 
provileges = "run as administrator". 

"upgrade" - upgrades chcolatey and all packages listed in packages.txt

"uninstall" - uninstalls all packages listed in packages.txt