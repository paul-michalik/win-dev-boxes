=================
Rationale
=================

Scripts to set up or bootstrap virtual and physical development boxes or CI/CD boxes. 

1. Select the required use case: Choose Windows version (win7, win10, winserver-...) and scenario (devbox, devbox-host, cibox, ...). "host" variants are provisioned with tools required to act as hosts for virtualized or Dockerized boxes. "devbox" variants are provisioned with interactive development tools (Visual Studio, etc) and "cibox" variants has a bare minimum to run a build and tests. 
2. Right-mouse click the respective *.bat file and "run as administrator" or run "runas /user:Administrator win10-cibox.bat"

=================
Adding new box configurations
=================
