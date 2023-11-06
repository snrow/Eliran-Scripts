# [ LiorDux ]                             [ M~ ]                      [ 22-09-2022 ]
# Auto Installation of docker on linux.
# Ubuntu based.
#
# Made by Avshalom Hadad + Eliran Ben Maor.
# Updated by Lior Dux.
#!/bin/bash set -x set -e

Prem=''
# Todo - fix - needs to set a sudo word and part of if.
if uname -a | grep -i "ubuntu"; then echo "Setting sudo commands"; Prem='sudo'; fi

# Removing any previous trace of docker
$Prem apt-get remove docker docker-engine docker.io containerd runc 2>/dev/null

# Set up the repository
$Prem apt-get update -y
$Prem apt-get install ca-certificates curl gnupg lsb-release -y

# Add Docker’s official GPG key:
$Prem mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add docker repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update and install docker
$Prem apt-get update -y
$Prem apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Post install - Create 'docker' group
$Prem groupadd docker 2>/dev/null

# Add your user to the docker group
$Prem usermod -aG docker $USER

# Activate the changes to group docker
newgrp docker
