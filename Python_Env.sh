
if [-d "my_env"]
then
	echo "Python virtual env exists"
else
	python -m venv my_env
fi

echo $PWD

source my_env/bin/activate
<<<<<<< HEAD:Python_Env.sh

=======
cd /var/lib/jenkins/workspace/Django/scripts
python -m pip install requirements.txt
>>>>>>> 72539bbac59354838833ed14f5f7444d19140e90:scripts/Python_Env.sh

echo "Python Env finishes"

python manage.py makemigrations
python manage.py migrate

echo "Migrations done"
deactivate
