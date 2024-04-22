#!bin/bash
python --version

#Install and Update Yum
sudo yum -y update
sudo yum -y install yum-utils
sudo yum -y groupinstall development 
sudo yum -y install gcc openssl-devel bzip2-devel libffi-devel sqlite-devel python-pip libsqlite3-dev
sudo yum -y install policycoreutils policycoreutils-python selinux-policy
sudo cp -rf nginx.repo /etc/yum.repos.d
sudo yum -y install nginx
#Install Python 3.X.X
cd /usr/src
sudo wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
sudo tar xzf Python-3.7.3.tgz
cd Python-3.7.3
./configure --enable-loadable-sqlite-extensions && make && sudo make install
which python3.7


python --version
sudo yum install -y java-11-openjdk-devel
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo yum install -y jenkins--nogpgcheck
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
