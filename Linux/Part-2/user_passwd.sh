#!/bin/bash

#This script creates a new user on the local system.
#You will be prompted to enter username (login), the person name and a password.
#The username, password and the host for the account will be displayed.

#Make sure the script is being executed with superuser privileges.

if [[ $UID != 0 ]]; then
    echo "You don't have superuser privileges. Make sure to run script as root user."
    exit 1
fi

#Get the username(login) 

read -p "Enter your login name: " login_name

#Get the real name (contents for the description field)

read -p "Enter your full name: " full_name

#Get the password

read -sp "Enter your password: " password

#Create the account

useradd -m ${login_name} -c "${full_name}" 

#Check to see if the useradd command succeeded
#We don't want to tell the user that an account was created when it hasn't been

if [[ ${?} != 0 ]]; then
    echo "This username is already exist. Please select different username."
    exit 1
fi

#Set the password

echo ${password} | passwd --stdin ${login_name}

#Check to see if the passwd command succeeded

if [[ ${?} != 0 ]]; then
    echo "This password couldn't set."
    exit 1
fi

#Force password change on first login

passwd -e ${login_name}

#Display the username, password and the the host where the user was created

echo ${login_name}
echo ${full_name}
echo ${password}