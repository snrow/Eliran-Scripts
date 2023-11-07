# Auto Installation of docker on linux.
# Ubuntu based.
#
# Made by Avshalom Hadad + Eliran Ben Maor.

#!/bin/bash set -x set -e
echo "Code written by : Eliran Ben Maor + Avshalom Hadad "
ehco "Last update: 04/09/2023"
echo "Last time checked: 04/09/2023 by: Eliran"

# Set up the repository
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg lsb-release -y

# Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add docker repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update and install docker
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Post install - Create 'docker' group
sudo groupadd docker 2>/dev/null

# Add your user to the docker group
sudo usermod -aG docker $USER

# Activate the changes to group docker
newgrp docker
