python --version

#Install and Update Yum
yum -y update
yum -y install yum-utils
yum -y groupinstall development 
yum -y install gcc openssl-devel bzip2-devel libffi-devel

#Install Python 3.X.X
cd /usr/src
wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
tar xzf Python-3.7.3.tgz
cd Python-3.7.3
./configure --enable-loadable-sqlite-extensions && make && sudo make install
which python3.7

