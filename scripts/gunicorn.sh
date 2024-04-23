
#!bin/bash
usermod -a -G root jenkins
cp -rf nginx.repo /etc/yum.repos.d
yum -y install nginx
cp -rf gunicorn.service /etc/systemd/system
usermod -a -G nginx root

echo "$USER"
echo "$PWD"
systemctl start gunicorn.service
systemctl daemon-reload
systemctl start gunicorn
systemctl enable gunicorn

echo "Gunicorn has been started"

systemctl status gunicorn
