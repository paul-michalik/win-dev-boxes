Bootstrapper for chocolatey https://chocolatey.org/ package manager + development tooling. Targets are Windows 7 machines as used at Harman around 07/08 2016.
1. Edit packages.txt. Add or remove packages as required. packages.txt contains a new-line separated list of chocolatey packages which are considered a basic equipment of a developer machine.
2. "install" installs chcolatey and all packages listed in packages.txt (*). Always run the script with elevated provileges = "run as administrator". 
3. "upgrade" upgrades chcolatey and all packages listed in packages.txt
3. "uninstall" upgrades chcolatey and all packages listed in packages.txt
