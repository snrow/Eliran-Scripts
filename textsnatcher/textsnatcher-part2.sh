#!/bin/bash

echo "##################### Downloading textsnatcher ######################"
flatpak install flathub com.github.rajsolai.textsnatcher 

echo "##################### Done ######################"
flatpak run com.github.rajsolai.textsnatcher


echo " The program should start  "
echo " The program is runing? "

read answer
if [ $answer == "y" ] || [ $answer == "Y" ] ; then
    echo "Great!! Enjoy :) "
else
    sudo apt install gnome-screenshot
    echo "now it should work!"
    flatpak run com.github.rajsolai.textsnatcher
fi
