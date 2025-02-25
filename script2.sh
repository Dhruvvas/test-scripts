#!/bin/bash
read -p "Enter the username: " username
read -s -p "Enter the password: " password
echo
read -s -p "Retype the password: " password_confirm

if [ $password != $password_confirm ]; then
        echo "Password is not matching."
        exit 1
fi

sudo useradd -m $username
echo "$username:$password" | sudo chpasswd

if [ $? -eq 0 ]; then
        echo "User $username is created successfully!!!!!!!"
else
        echo "User creation failed"
        exit 1
fi

read -p "Enter the username to delete: " $username
sudo userdel -r $username

if ! grep -q "^$username:" /etc/passwd; then
        echo "User has been deleted successfully."
else
        echo "User still exist."
fi
