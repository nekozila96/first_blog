sudo cp -rf gunicorn.service /etc/systemd/system

echo "$USER"
echo "$PWD"
sudo systemctl start gunicorn.service
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn has been started"

sudo systemctl status gunicorn
