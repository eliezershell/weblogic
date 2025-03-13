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
unzip fmw_14.1.1.0.0_wls_lite_slim_Disk1_1of1.zip
java -jar fmw_14.1.1.0.0_wls_lite_quick_slim_generic.jar
