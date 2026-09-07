#!/bin/bash 

echo "Making your server ready for you sir..."
echo "installing the updates for you sir..."
apt-get update -y

echo "installing the tree package for you sir...."
apt-get install -y tree 
echo "installation completed this tree package for you sir..."

echo "making the project folder for you sir..."
mkdir -p /home/ubuntu/project
cd /home/ubuntu/project

echo "installing the docker.io package for your server sir...."
apt-get install -y docker.io 

echo "installing git for you sir..."
apt-get install -y git 

echo "starting and enabling docker service..."
systemctl start docker
systemctl enable docker

echo "Adding ubuntu user to docker group..."
usermod -aG docker ubuntu
chmod 666 /var/run/docker.sock

echo "Restarting Docker service..."
systemctl restart docker

echo "installing docker compose..."
apt-get update -y && apt-get install -y docker-compose-v2



chmod 755 runtf.sh
chmod 755 setenvtf.sh
chmod 755 basicenv.sh

echo "now trigger this new file also"
./setenvtf.sh

echo "////***** here your server is ready sir...*****////"
