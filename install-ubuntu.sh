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
script_path=$(java -jar fmw_14.1.2.0.0_wls.jar -silent 2>&1 | grep -oE '/tmp/createCentralInventory[0-9]+\.sh')

# Instalar inventário central
sudo ${script_path} /opt/oraInventory ${USER}

# instalar novamente o weblogic
sudo mkdir -p /opt/oracle/middleware
sudo chown -R ${USER}:${USER} /opt/oracle
chmod -R 775 /opt/oracle
java -jar fmw_14.1.2.0.0_wls.jar -silent -responseFile ${PWD}/wls_response.rsp
