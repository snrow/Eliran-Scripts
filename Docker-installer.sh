#!/bin/bash
# install docker on linux Ubuntu
# removing any trace of docker 
sudo apt-get remove docker docker-engine docker.io containerd runc 2>/dev/null

#Set up the repository
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg lsb-release -y

#Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#setup the repository

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

#post install
#create docker group
sudo groupadd docker  2>/dev/null

#Add your user to the docker group
sudo usermod -aG docker $USER

#activate the changes to group docker
newgrp docker
