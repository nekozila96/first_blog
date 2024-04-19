sudo cp -rf nginx.repo /etc/yum.repos.d
yum -y install nginx


sudo cp -rf testdjango.conf /etc/nginx/conf.d

sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx

echo "Gunicorn has been started"

sudo systemctl status nginx

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g'  /etc/selinux/config
