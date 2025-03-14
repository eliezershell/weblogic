#!/bin/bash
sudo yum update -y

# criar swap
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# instalar oracle jdk
sudo rpm -ivh jdk-17.0.12_linux-x64_bin.rpm

# instalar weblogic
script_path=$(java -jar fmw_14.1.2.0.0_wls.jar -silent 2>&1 | grep -oE '/tmp/createCentralInventory[0-9]+\.sh')

# Instalar inventário central
sudo ${script_path} /opt/oraInventory ${USER}

# instalar novamente o weblogic
sudo mkdir -p /opt/oracle/middleware
sudo chown -R ${USER}:${USER} /opt/oracle
chmod -R 775 /opt/oracle
java -jar fmw_14.1.2.0.0_wls.jar -silent -responseFile ${PWD}/wls_response.rsp


cd /opt/oracle/middleware/oracle_common/common/nodemanager/security
keytool -genkey -alias DemoIdentity -keyalg RSA -keystore DemoIdentity.jks -storepass changeit -keypass changeit -validity 365 -dname "CN=weblogic, OU=IT, O=MyCompany, L=City, S=State, C=BR"

cd /opt/oracle/middleware/wlserver/server/bin

vi /opt/oracle/middleware/oracle_common/common/nodemanager/nodemanager.properties
"
KeyStores=CustomIdentityAndCustomTrust
CustomIdentityKeyStoreFileName=/opt/oracle/middleware/oracle_common/common/nodemanager/security/DemoIdentity.jks
CustomIdentityKeyStorePassPhrase=changeit
"
