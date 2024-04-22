#!bin/bash
sudo cp -rf testdjango.conf /etc/nginx/conf.d
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

sudo sed -i 's/PrivateTmp=True/PrivateTmp=False/g' /lib/systemd/system/nginx.service
setsebool -P httpd_can_network_connect 1
setsebool -P httpd_can_network_relay 1
sudo nginx -t
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config

sudo systemctl start nginx
sudo systemctl enable nginx

echo "Gunicorn has been started"

sudo systemctl status nginx
