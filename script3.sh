#!/bin/bash
<<info
This shell script checks whether user exists or not.
info

read -p "Enter the username you wish to check: " username

count=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

if [ $count -eq 0 ];
then
        echo "User does not exit."
else
        echo "User exists."
fi
