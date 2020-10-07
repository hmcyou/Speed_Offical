#Caddy 安装脚本，根据官方文档
mkdir caddy && cd caddy
mkdir -p /etc/caddy/
touch /etc/caddy/Caddyfile

wget https://github.com/caddyserver/caddy/releases/download/v2.2.0/caddy_2.2.0_linux_amd64.tar.gz
tar -xzvf caddy_2.2.0_linux_amd64.tar.gz

mv caddy /usr/bin/

groupadd --system caddy

useradd --system \
    --gid caddy \
    --create-home \
    --home-dir /var/lib/caddy \
    --shell /usr/sbin/nologin \
    --comment "Caddy web server" \
    caddy
	
wget https://github.com/caddyserver/dist/raw/master/init/caddy.service

mv caddy.service /etc/systemd/system/

systemctl daemon-reload

systemctl enable caddy

systemctl start caddy

echo "安装完成，请编辑 /etc/caddy/Caddyfile 文件，完成后执行systemctl restart caddy && systemctl status caddy"

rm -rf caddy/ caddyinstall.sh
