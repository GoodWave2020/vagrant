#!/bin/sh
echo 'start yum update'
yum update -y
echo 'update finished'
# ソースのシンボリックリンクを作成
echo 'add symlink to src'
ln -s /home/vagrant/src /var/www
echo 'symlink added'
# nginxのインストール、初期設定
echo '####################################'
echo '########## install nginx ###########'
echo '####################################'
rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum install nginx -y
rm /etc/nginx/conf.d/default.conf
# 設定ファイル上書き
\cp -f /home/vagrant/provision/nginx.conf /etc/nginx/nginx.conf
systemctl enable nginx
systemctl start nginx
echo 'nginx installed'
echo '####################################'
echo '########## install nodejs ##########'
echo '####################################'
curl -fsSL https://rpm.nodesource.com/setup_current.x | bash -
yum install -y nodejs