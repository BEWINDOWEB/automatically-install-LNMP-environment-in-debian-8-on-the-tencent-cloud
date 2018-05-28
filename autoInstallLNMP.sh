#!/bin/sh
set -e
#######################################
echo "========================= now step(1/4):add dotdeb packages... ========================="
if [ ! -f "/etc/apt/sources.list.d/tencent.list" ]; then
  mv /etc/apt/sources.list /etc/apt/sources.list.d/tencent.list
fi

cat>/etc/apt/sources.list<<EOF
deb http://packages.dotdeb.org jessie all
deb-src http://packages.dotdeb.org jessie all
EOF
wget -P /tmp https://www.dotdeb.org/dotdeb.gpg
apt-key add /tmp/dotdeb.gpg
apt-get update
#######################################
echo "========================= now step(2/4):install php7.0... ========================="
apt-get -y install php7.0-fpm php7.0-mysql php7.0-common php7.0-gd php7.0-json php7.0-cli php7.0-curl php7.0-mbstring
#######################################
echo "========================= now step(3/4):install nginx... ========================="

apt-get -y install nginx
rm /etc/nginx/sites-enabled/default
cat>/etc/nginx/sites-enabled/bewindoweb_test.conf<<EOF
server {
        listen 80 default_server;
        server_name bewindoweb.com;
        charset utf-8;
        location /{
                root /tmp/testweb;
                index index.php index.html index.htm index.nginx-debian.html;
        }

        location ~ .php$ {
                fastcgi_pass unix:/run/php/php7.0-fpm.sock;
                fastcgi_index index.php;
                fastcgi_param SCRIPT_FILENAME /tmp/testweb/\$fastcgi_script_name;
                include fastcgi_params;
        }
}
EOF
service nginx restart

if [ ! -d "/tmp/testweb" ]; then
  mkdir /tmp/testweb
fi
cat>/tmp/testweb/index.php<<EOF
<?php
echo <<<EOF
==========================================
<h3>information</h3>
nginx,php7.0,php-fpm:OK</br>
mysql: You need to test it by yourself :)</br>
==========================================
<h3>What i have done except installing nginx,php,php-fpm,mysql?</h3>
1) add source package: check it at <b>/etc/apt/sources.list</b> and <b>/etc/apt/sources.list.d/tencent.list</b></br>
2) add nginx configure file:check it at <b>/etc/nginx/sites-enabled/bewindoweb_test.conf</b></br>
3) add test phpfile:check it at <b>/tmp/testweb/index.php</b></br>
==========================================
<h3>you can follow me on</h3>
<a href='http://www.bewindoweb.com'>personal website</a> and <a href='https://github.com/BEWINDOWEB'>github</a>
EOF;
echo phpinfo();
?>
EOF

#######################################
echo "========================= now step(4/4):install mysql...8.0 is the newest version , 5.6 is the common version. ========================="
wget -P /tmp http://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
dpkg -i /tmp/mysql-apt-config_0.8.10-1_all.deb
apt-get update
apt-get -y install mysql-server

echo "Finished! Please Input your IP address in the browser,and then you can see the result."