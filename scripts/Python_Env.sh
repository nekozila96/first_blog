#!/bin/bash
cd /var/lib/jenkins/workspace/Django
python --version
if [ -d "my_env" ]; then
    echo "Existted folder !"
else
    python -m venv my_env
fi
source my_env/bin/activate
pip3 install --upgrade pip
pip3 install django==2.0
pip3 -m pip install gunicorn


echo "Python Env finishes"

python3 manage.py makemigrations
python3 manage.py migrate

echo "Migrations done"
deactivate
