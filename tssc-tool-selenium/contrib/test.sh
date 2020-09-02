#!/bin/bash

echo -e "\nTSSC selenium container test..."

echo -e "\n\tjava -version: "
java -version

echo -e "\n\tmvn -v"
mvn -v

echo -e "\n\tList of files and directories in /opt:"
ls /opt/

echo -e "\nTest complete."
