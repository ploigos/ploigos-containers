# TSSC SonarQube Image

This repository contains the Dockerfile and supporting files for creating the sonar TSSC image for the sonar scanner command line interface:

* Provides an installation of the sonar CLI and makes it available in the PATH per documentation:
    https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/ 
* The executable is named 'sonar-scanner'.
* Hint:  In python to execute sonar-scanner using sh.command(), substitute the dash with underscore:
    eg: sh.sonar_scanner()
    https://amoffat.github.io/sh/sections/faq.html
