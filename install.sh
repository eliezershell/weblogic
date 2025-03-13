#!/bin/bash

# dependências
sudo apt update -y
sudo apt install unzip -y

# criar swap
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# instalar oracle jdk
sudo dpkg -i jdk-11.0.26_linux-x64_bin.deb

# instalar weblogic
unzip V1045131-01.zip
java -jar fmw_14.1.2.0.0_wls.jar
