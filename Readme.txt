Bootstrapper for chocolatey https://chocolatey.org/ package manager + development tooling. Targets are Windows 7 machines as used at Harman around 07/08 2016. Follow these steps:
1. packages.txt contains a new-line separated list of chocolatey packages which are considered a basic equipment of a developer machine.
2. "install.bat install" installs chcolatey and all packages listed in packages.txt (*)
3. "install.bat upgrade" upgrades chcolatey and all packages listed in packages.txt

(*) In fact the parameters are just forwarded to choco so the command "install.bat install" is equivalent to "choco install <package1> & choco install <package2>"
