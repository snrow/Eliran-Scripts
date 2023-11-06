#!/bin/bash
echo "Code written by : Eliran Ben Maor"
ehco "Last update: 04/09/2023"
echo "Last time checked: 04/09/2023 by: Eliran"


echo "Updating all of package sources before installing"
sudo yum update -y
echo "Done Updating"

echo "Starting to download Docker now"
sudo yum install docker -y
echo ""
echo "Done instaliing docker"

echo "Start the Docker service. + Enable the Docker service to start on boot."
sudo systemctl start docker
sudo systemctl enable docker
echo "Done with Docker service"

echo "Add your user to the Docker group to allow executing Docker commands without sudo"
sudo usermod -a -G docker ec2-user
echo "Done!"


echo "Adding alias"
echo "alias dc='docker-compose'" >> ~/.bashrc
source ~/.bashrc 
echo "You can use docker-compose with just -dc-"
docker --version


