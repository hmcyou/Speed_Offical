#!/bin/bash

echo root:123qwe |sudo chpasswd root
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;

ervice ssh restart

clear
echo "***********白嫖成功！***********"
echo "IP地址:"
curl ip.sb
echo "SSH端口号:6000  用户名:root  密码:123qwe"
