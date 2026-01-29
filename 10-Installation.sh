#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -gt 0 ]
    echo "Please run this script with root user :)"
    exit 3;
fi

echo "Installing nginx..."
dnf install nginx -y

if [ $? -eq 0 ]; then
    echo "Installation of nginx SUCESS"
else 
    echo "Installation of nginx FAILURE"
fi
