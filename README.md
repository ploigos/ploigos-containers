# tssc-containers
Container image definitions for the TSSC project

## tssc-base
![tssc-base-publish](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-base-publish/badge.svg?branch=master)

Defines the base TSSC container image, from which all other TSSC images derive.

## tssc-maven
![tssc-maven-publish](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-maven-publish/badge.svg?branch=master)
Defines a java / maven container image. Built from tssc-base.

## tssc-maven-jenkins-agent
Defines a jenkins agent for java and maven. Built from tssc-maven.
