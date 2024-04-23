
#!bin/bash
usermod -a -G root jenkins
sudo cp -rf nginx.repo /etc/yum.repos.d
sudo yum -y install nginx
sudo cp -rf gunicorn.service /etc/systemd/system
usermod -a -G nginx root

echo "$USER"
echo "$PWD"
sudo systemctl start gunicorn.service
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn has been started"

systemctl status gunicorn
