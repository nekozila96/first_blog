
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
deactivate

python --version
python -m gunicorn --version

sudo cp -rf nginx.repo /etc/yum.repos.d
sudo yum -y install nginx
sudo cp -rf gunicorn.service /etc/systemd/system
chmod +x gunicorn.service

echo "$USER"
echo "$PWD"
sudo systemctl start gunicorn.service
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn has been started"

sudo systemctl status gunicorn
