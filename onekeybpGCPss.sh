#!/bin/bash

echo root:123qwe |sudo chpasswd root
sudo sed -i 's/^#\?Port 22/Port 28/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
service ssh restart

ip=`curl ip.sb`

mkdir gost && cd gost
wget https://github.com/ginuerzh/gost/releases/download/v2.11.1/gost-linux-amd64-2.11.1.gz
gunzip gost-linux-amd64-2.11.1.gz
chmod +x gost-linux-amd64-2.11.1
mv gost-linux-amd64-2.11.1 /usr/bin/gost

ss="chacha20-ietf:gcpnb888@$ip:6000"
ssp="ss://$(echo $ss | base64)#baipiaogcp"
clear
echo "- - - - - - -  - - - - - - - -  - - -"
echo "白嫖成功，请复制下面的ss链接"
echo $ssp
echo -e "\n"
gost -L ss://chacha20-ietf:gcpnb888@:22
