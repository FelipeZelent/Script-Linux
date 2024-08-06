#!/bin/bash

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /ifa

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_IFA

echo "Criando usuários..."

useradd julio -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM
useradd mariana -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN
useradd renata -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN

useradd ana -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_IFA
useradd amanda -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_IFA
useradd giovana -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_IFA


echo "Especificando permissões dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_IFA /ifa

chmod 770 /adm
chmod 770 /ven
chmod 770 /ifa
chmod 777 /publico

echo "Fim..."

echo "Apache-server-linux"

#!/bin/bash

echo "Att Server"
apt-get update
apt-get upgrade -y
apt-get install apache2 -y
apt-get install unzip -y

echo "baixando zip"

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html/
