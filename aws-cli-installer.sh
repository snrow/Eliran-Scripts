#!bin/bash
unzip 
if [ $? -eq 0 ]; then
    echo zip is installed
else
    sudo apt install unzip
fi

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo rm -rf awscliv2.zip
sudo rm -rf ./aws