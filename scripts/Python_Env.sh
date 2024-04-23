#!/bin/bash
cd /var/lib/jenkins/workspace/Django
python --version

python3 -m venv my_env
source ./my_env/bin/activate
pip install --upgrade pip
pip3 install django==2.0 
pip3 install gunicorn 


echo "Python Env finishes"

python3 manage.py makemigrations
python3 manage.py migrate

echo "Migrations done"
deactivate
