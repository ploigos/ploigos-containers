# ploigos-tool-zap

This repository contains the container definition for creating the Ploigos workflow
[ZAProxy](https://owasp.org/www-project-zap/) CLI tool container image.

This container image is intended to be used as the container image to run Ploigos workflow steps
in that require access to the [ZAProxy](https://owasp.org/www-project-zap/)
CLI tool.

Installed CLI tools:
* `/zap/zap.sh`

**NOTE**
The expected operation of this is to use the `/home/.ZAP` directory as the working storage for the
application. This means that any calls to `zap.sh` should have the parameter `-dir /home/.ZAP`. If
you do not add those parameters, you will need to configure your own `${HOME}/.ZAP` directory
with the correct data before ZAP will work.
