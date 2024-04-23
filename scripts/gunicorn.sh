
#!bin/bash

sudo -n cp -rf nginx.repo /etc/yum.repos.d
sudo -n yum -y install nginx
sudo -n cp -rf gunicorn.service /etc/systemd/system
usermod -a -G nginx root

echo "$USER"
echo "$PWD"
sudo -n systemctl start gunicorn.service
sudo -n systemctl daemon-reload
sudo -n systemctl start gunicorn
sudo -n systemctl enable gunicorn

echo "Gunicorn has been started"

sudo -n systemctl status gunicorn
