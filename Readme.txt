=================
Rationale
=================

Scripts to set up or bootstrap virtual and physical development boxes or CI/CD boxes. 

1. Select the required use case: Choose Windows version (win7, win10, winserver-...) and scenario (devbox, devbox-host, cibox, ...). "Host" variants are provisioned with tools required to act as hosts for virtualized or Dockerized boxes. "Devbox" is provisioned with interactive development tools (Visual Studio, etc) and the "cibox" has a bare minimum to run a build and tests. 
2. Right-mouse click the respective *.bat file and "run as administrator" or run "runas /user:Administrator win10-cibox.bat"

=================
Adding new boxes
=================

1. Add new packages-<scenario-name>.config files as required or re-use the existing one. The packages-*.config file must obey to the NuGet or Chocolatey specification as defined on Choco homepage: https://chocolatey.org/docs/commands-install. 
2. Provide an invocation script <scenario-name>.bat. Invoke to provision the machine. The invcation scripts are all identical - a "<scenario-name>.bat" invokes "choco install packages-<scenario-name>.config /y"


=================
Auxiliary scripts
=================

"deploy-scripts.bat" - Copy contents of the directory to specified location. 

"install-choco.bat" - Bootstraps Choclatey and installs the packages passed via CLI. 