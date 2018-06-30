# automatically install LNMP environment in debian 8 on the tencent cloud
![通过测试](https://img.shields.io/badge/build-passing-green.svg)
![主机需要腾讯云](https://img.shields.io/badge/server-tencentcloud-orange.svg)
![系统需要debian8.2 64位](https://img.shields.io/badge/debian-8.2(64%20bit)-orange.svg)
![PHP7.0以上](https://img.shields.io/badge/php-%E2%89%A57.0-blue.svg)
![nginx1.12以上](https://img.shields.io/badge/nginx-%E2%89%A51.12-blue.svg)
![mysql5.6/5.7/8.0](https://img.shields.io/badge/mysql-5.6/5.7/8.0-blue.svg)
>一个在腾讯云Debian系统上自动搭建LNMP环境的脚本。<br>
>A script for automatically building LNMP environment on Tencent cloud Debian system.
<font color=#A3CD39>在腾讯云广州服务器debian8.2（64位）运行良好</font>
<font color=#F75940>2018年6月30日测试，百度云苏州服务器debian 8.1.0 amd64(64位)系统同样可用，但由于网络链路不同，下载mysql的速度较慢</font>
## 1. 如何使用？
1) 首先在腾讯云服务器上安装debian 8.2(64位)
2) 用FTP上传*autoInstallLNMP.sh*或者用wget的方式，把脚本文件传到服务器上：
```sh
wget "https://github.com/BEWINDOWEB/automatically-install-LNMP-environment-in-debian-8-on-the-tencent-cloud/archive/master.zip"
```
3) 运行脚本
```sh
chmod 755 autoInstallLNMP.sh
./autoInstallLNMP.sh
```
4) 在运行过程中，你可以选择mysql-server的版本 *5.6/5.7/8.0* , 推荐使用5.6版本，默认是最新版本8.0
5) 在运行过程中，你需要设置mysql-server的*登录密码*

## 2. 我怎么知道我安装成功了?
1) 如果你顺利安装，它会提示：*"Finished! Please Input your IP address in the browser,and then you can see the result."*
2) 你可以在浏览器地址栏输入ip地址，预期应该能看到如下页面：
```
==========================================
information
nginx,php7.0,php-fpm:OK
mysql: You need to test it by yourself :)
==========================================
What i have done except installing nginx,php,php-fpm,mysql?
1) add source package: check it at /etc/apt/sources.list and /etc/apt/sources.list.d/tencent.list
2) add nginx configure file:check it at /etc/nginx/sites-enabled/bewindoweb_test.conf
3) add test phpfile:check it at /tmp/testweb/index.php
==========================================
you can follow me on
personal website and github
```
## 3.其他
欢迎提交issues,个人网站[www.bewindoweb.com](http://www.bewindoweb.com) 或者 [www.bewindoweb.cn](http://www.bewindoweb.cn)

		
## 1. HOW TO USE?
1) be sure you have installed the **debian 8.2(64 bit)** on the **tencent cloud** server
2) upload the *autoInstallLNMP.sh* to the server by ftp OR use 
```sh
wget "https://github.com/BEWINDOWEB/automatically-install-LNMP-environment-in-debian-8-on-the-tencent-cloud.git"
```
3) run the shell
```sh
chmod 755 autoInstallLNMP.sh
./autoInstallLNMP.sh
```
4) during running the shell, you can choose mysql-server version *5.6/5.7/8.0* , ver5.6 is recommended, ver8.0 is the newest and default option
5) during running the shell, you have to set your mysql-server *password*

## 2. HOW CAN I KOWN THAT I HAVE INSTALLED LNMP SUCCESSFULLY?
1) if the installation is smooth, it will show *"Finished! Please Input your IP address in the browser,and then you can see the result."*
2) you can input our IP address in the browser ,and you may see:
```
==========================================
information
nginx,php7.0,php-fpm:OK
mysql: You need to test it by yourself :)
==========================================
What i have done except installing nginx,php,php-fpm,mysql?
1) add source package: check it at /etc/apt/sources.list and /etc/apt/sources.list.d/tencent.list
2) add nginx configure file:check it at /etc/nginx/sites-enabled/bewindoweb_test.conf
3) add test phpfile:check it at /tmp/testweb/index.php
==========================================
you can follow me on
personal website and github
```
## 3.at last
welcome to propose issues, and forgive me for poor English, my website is [www.bewindoweb.com](http://www.bewindoweb.com) or [www.bewindoweb.cn](http://www.bewindoweb.cn)
