#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -gt 0 ]; then
    echo "Please run this script with root user :)"
    exit 3;
fi

VALIDATE(){
    if [ $1 -eq 0 ]; then
        echo "... $2 SUCESS"
    else 
        echo "... $2 FAILURE"
fi
}

dnf install nginx -y
VALIDATE $? "Installing Nginx"

dnf install mysql -y
VALIDATE $? "Installing MYSQL"




