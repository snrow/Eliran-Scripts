#!/bin/bash

sudo apt-get install openssh-server
echo "Enable and start the ssh service immediately"
sudo systemctl enable ssh --now
