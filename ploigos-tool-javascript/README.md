# ploigos-tool-javascript

This repository contains the container definition for creating the Ploigos workflow
javascript with [Nodejs](https://www.nodejs.org/) and [NPM](https://www.npmjs.com/) CLI tool container image.

This container image is intended to be used as the container image to run Ploigos workflow steps
in that require access to the [Nodejs](https://www.nodejs.org/) and [NPM](https://www.npmjs.com/) CLI tools.

**Note:** selenium is a common framework used for user interface testing and UAT.
       The npm selenium web driver package requires java in order to execute
       selenium tests. For this reason, java is used as the base image
