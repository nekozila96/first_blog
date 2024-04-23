
#!/bin/bash
python --version
python -m gunicorn --version

sudo cp -rf nginx.repo /etc/yum.repos.d
sudo yum -y install nginx
sudo cp -rf gunicorn.service /etc/systemd/system


echo "$USER"
echo "$PWD"
sudo systemctl start gunicorn.service
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn has been started"

systemctl status gunicorn
