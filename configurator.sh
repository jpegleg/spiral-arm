#!/usr/bin/env bash
echo "Welcome to the Spiral Arm Configurator."
echo "---------------------------------------"
echo "-----------------------------------"
echo "--------------------------------"
echo "-----------------------------"
echo "---------------------------"
echo " "
echo "Running sample results."
sleep 2;
ps aux | grep ssh | grep -v grep | grep -v root | grep -v lock.sh
echo "       ";
echo "The data above is what the default configuration will target."
echo "If your box requires a large number of ssh sessions or ssh applications,"
echo "or many active development users, this default configuration will"
echo "likely need to be changed to target only what you want with the kill."
echo "You can whitelist easily. But managing a very large (12+) whitelist is not"
echo "yet practical with Spiral Arm. But it is possible."
echo "You can easily change ssh to another key word by editing scripts."
echo "If you do, you should make a branch on github https://github.com/jpegleg/spiral-arm."
sleep 3;
echo "~Keegan Bowen"
