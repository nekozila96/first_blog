#!/bin/bash
cd /var/lib/jenkins/workspace/Django
python --version
if [ -d "my_env" ]; then
    echo "Existted folder !"
else
    python3 -m venv my_env
fi
source ./my_env/bin/activate
pip install --upgrade pip
python3 -m pip install django==2.0 --jenkins
python3 -m pip install gunicorn --jenkins


echo "Python Env finishes"

python3 manage.py makemigrations
python3 manage.py migrate

echo "Migrations done"
deactivate
