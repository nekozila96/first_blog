
#!/bin/bash
cd /var/lib/jenkins/workspace/Django
python --version

python -m venv my_env
source my_env/bin/activate
pip install --upgrade pip
python install django==2.0 
python install gunicorn 


echo "Python Env finishes"

python manage.py makemigrations
python manage.py migrate

echo "Migrations done"
deactivate
