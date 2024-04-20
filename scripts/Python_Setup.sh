python --version

#Install and Update Yum
sudo yum -y update
sudo yum -y install yum-utils
sudo yum -y groupinstall development 
sudo yum -y install gcc openssl-devel bzip2-devel libffi-devel sqlite-devel python-pip libsqlite3-dev
sudo yum -y install policycoreutils policycoreutils-python selinux-policy
#Install Python 3.X.X
cd /usr/src
sudo wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
sudo tar xzf Python-3.7.3.tgz
cd Python-3.7.3
./configure --enable-loadable-sqlite-extensions && make && sudo make install
which python3.7

