#!/bin/bash

USER_ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/$0.log"

if [ $USER_ID -gt 0 ]; then
    echo "Please run this script with root user :)"
    exit 3;
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -eq 0 ]; then
        echo "$2 ... SUCESS"
    else 
        echo "$2 ... FAILURE"
fi
}

dnf install nginx -y &>>$LOGS_FILE
VALIDATE $? "Installing Nginx"

dnf install mysql -y &>>$LOGS_FILE
VALIDATE $? "Installing MYSQL"

dnf install nodejs -y &>>$LOGS_FILE
VALIDATE $? "Installing NodeJS"