sudo cp -rf gunicorn.service /etc/systemd/system

echo "$USER"
echo "$PWD"

sudo sytemctl daemon-reload
sudo sytemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn has been started"

sudo systemctl status gunicorn
