#!/usr/local/bin/python3.7


cd /var/lib/jenkins/workspace/Django
python --version
if [ -d "my_env" ]; then
    echo "Thư mục tồn tại."
else
    python -m venv my_env
fi
source my_env/bin/activate
python -m pip install --upgrade pip
python -m pip install django==2.0
python -m pip install gunicorn


echo "Python Env finishes"

python manage.py makemigrations
python manage.py migrate

echo "Migrations done"
deactivate
