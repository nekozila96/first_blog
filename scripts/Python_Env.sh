
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
python --version

python3 -m venv my_env
source my_env/bin/activate
pip3 install --upgrade pip
python3 install django==2.0 
python3 install gunicorn 


echo "Python Env finishes"

python3 manage.py makemigrations
python3 manage.py migrate

echo "Migrations done"
deactivate
