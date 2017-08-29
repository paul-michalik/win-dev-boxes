=================
Rationale
=================

Scripts to set up or bootstrap virtual and physical development boxes or CI/CD boxes. 

1. Add new packages-*.config files as required or re-use the existing one. The packages-*.config file must obey to the NuGet or Chocolatey specification as defined on Choco homepage: https://chocolatey.org/docs/commands-install. 
2. Provision the machine. Select the required use case: Choose Windows version (win7, win10, winserver-...) and scenario (devbox, devbox-host, cibox, ...). "Host" variants are provisioned with tools required to act as hosts for virtualized or Dockerized boxes. "Devbox" is provisioned with interactive development tools (Visual Studio, etc) and the "cibox" has a bare minimum to run a build and tests. 
3. Right-mouse click the respective *.bat file and "run as administrator"

=================
Auxiliary scripts
=================

"deploy-scripts" - Copy contents of the directory to specified location. 

"install-choco" - Installs chcolatey. 