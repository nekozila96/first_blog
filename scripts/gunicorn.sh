
#!bin/bash
sudo visudo jenkins ALL=(ALL) NOPASSWD: ALL
sudo cp -rf nginx.repo /etc/yum.repos.d
yum -y install nginx
sudo cp -rf gunicorn.service /etc/systemd/system
usermod -a -G nginx root

echo "$USER"
echo "$PWD"
sudo systemctl start gunicorn.service
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn has been started"

sudo systemctl status gunicorn
