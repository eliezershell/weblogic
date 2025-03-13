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

sudo dpkg -i jdk-11.0.26_linux-64_bin.deb
sudo mkdir -p /usr/lib/jvm
sudo cp -r jdk-11.0.26-oracle-x64 /usr/lib/jvm 

# nesse ponto o comando java -version deve estar exbindo a versão do java instalado
# se não estiver funcionando deve-se usar o comando update-alternatives sugerido pelo chatgpt
# também deve-se definir as versões do java no bashrc

# instalar weblogic
unzip fmw_14.1.1.0.0_wls_lite_slim_Disk1_1of1.zip
java -jar fmw_14.1.1.0.0[...].jar

