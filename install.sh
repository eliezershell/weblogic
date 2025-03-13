#!/bin/bash
sudo apt update -y

# criar swap
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# instalar oracle jdk
sudo dpkg -i jdk-17.0.12_linux-x64_bin.deb

# instalar weblogic
java -jar fmw_14.1.2.0.0_wls.jar -silent

# Instalar inventário central
/tmp/createCentralInventory1741902815511.sh /opt/oraInventory ubuntu
