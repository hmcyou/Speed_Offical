#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

Install_caddy(){
	#Caddy 安装脚本，根据官方文档
	`mkdir caddy && cd caddy`
	`mkdir -p /etc/caddy/`
	`touch /etc/caddy/Caddyfile`
	`wget https://github.com/caddyserver/caddy/releases/download/v2.2.0/caddy_2.2.0_linux_amd64.tar.gz`
	`tar -xzvf caddy_2.2.0_linux_amd64.tar.gz`
	`mv caddy /usr/bin/`
	`groupadd --system caddy`
	`useradd --system \
		--gid caddy \
		--create-home \
		--home-dir /var/lib/caddy \
		--shell /usr/sbin/nologin \
		--comment "Caddy web server" \
		caddy`
	`wget https://github.com/caddyserver/dist/raw/master/init/caddy.service`
	`mv caddy.service /etc/systemd/system/`
	`systemctl daemon-reload`
	`systemctl enable caddy`
	`systemctl start caddy`
	systemctl status caddy
	Estart
	echo "安装完成，请编辑 /etc/caddy/Caddyfile 文件，完成后执行systemctl restart caddy && systemctl status caddy"
	`rm -rf caddy/ caddy_2.2.0_linux_amd64.tar.gz`
}

Uninstall_caddy(){
	`systemctl stop caddy`
	`rm -rf /usr/bin/caddy /etc/systemd/system/caddy.service /etc/caddy/`
	Estart
	echo "卸载完成"
}

Start_caddy(){
	`systemctl start caddy`
	Estart
	echo "caddy 已启动"
}

Stop_caddy(){
	`systemctl stop caddy`
	Estart
	echo "caddy 已停止"
}

Restart_caddy(){
	`systemctl restart caddy`
	Estart
	echo "caddy 重启成功"
}

Edit_caddy(){
	nano /etc/caddy/Caddyfile
}

Estart(){
echo && echo -e "  caddy Debian/ubuntu 一键安装脚本
  
	1.安装 caddy
	2.卸载 caddy
	————————————————————————
	3.启动 caddy
	4.停止 caddy
	5.重启 caddy
	————————————————————————
	6.编辑配置文件
	————————————" && echo
read -e -p " 请输入数字 [1-5]:" num
case "$num" in
	1)
	Install_caddy
	;;
	2)
	Uninstall_caddy
	;;
	3)
	Start_caddy
	;;
	4)
	Stop_caddy
	;;
	5)
	Restart_caddy
	;;
	6)
	Edit_caddy
	;;
	*)
	echo "请输入正确数字 [1-5]"
	;;
esac
}
Estart
