

echo $PWD
cd /var/lib/jenkins/workspace/Django

source my_env/bin/activate
pip install --upgrade pip
python -m pip install django==2.0
python -m pip install gunicorn


echo "Python Env finishes"

python manage.py makemigrations
python manage.py migrate

echo "Migrations done"
deactivate
