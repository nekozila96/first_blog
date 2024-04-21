
sudo cp -rf testdjango.conf /etc/nginx/conf.d

sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx

echo "Gunicorn has been started"

sudo systemctl status nginx

