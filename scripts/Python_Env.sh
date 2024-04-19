cd /var/jenkins_home/workspace/Django/scripts
if [-d "my_env"]
then
	echo "Python virtual env exists"
else
	python -m venv my_env
fi

echo $PWD

source my_env/bin/activate

python -m pip install requirements.txt

echo "Python Env finishes"

python manage.py makemigrations
python manage.py migrate

echo "Migrations done"
deactivate
