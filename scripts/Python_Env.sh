
#!/bin/bash
sudo yum update -y
sudo yum -y install git gcc zlib-devel bzip2-devel readline-devel sqlite-devel openssl-devel
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
source $HOME/.bashrc
pyenv --version
pyenv install 3.6.5
pyenv global
pyenv global 3.6.5
pyenv global
python --version

cd /var/lib/jenkins/workspace/Django
python3 -m pip install --upgrade pip
pip3 install virtualenv
virtualenv my_env
source my_env/bin/activate

python3 -m pip install django==2.0 
python3 -m pip install gunicorn 


echo "Python Env finishes"

python3 manage.py makemigrations
python3 manage.py migrate

echo "Migrations done"


python --version
python -m gunicorn --version
cd /var/lib/jenkins/workspace/Django/scripts
sudo cp -rf nginx.repo /etc/yum.repos.d
sudo yum -y install nginx
chmod 777 -R /var/lib/jenkins/workspace/Django/scripts
sudo usermod -a -G nginx jenkins
which gunicorn
sudo cp -rf gunicorn.service /etc/systemd/system
chmod +x gunicorn.service

echo "$USER"
sudo systemctl daemon-reload
sudo systemctl start gunicorn.service
sudo systemctl start gunicorn
sudo systemctl enable gunicorn



sudo systemctl status gunicorn
echo "Gunicorn has been started"

sudo cp -rf testdjango.conf /etc/nginx/conf.d
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

sudo sed -i 's/PrivateTmp=True/PrivateTmp=False/g' /lib/systemd/system/nginx.service
sudo setsebool -P httpd_can_network_connect 1
sudo setsebool -P httpd_can_network_relay 1
nginx -t
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config
touch /var/run/nginx.pid
sudo chown -R nginx:nginx /var/run/nginx.pid
deactivate
sudo systemctl daemon-reload
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx

echo "Nginx has been started"


