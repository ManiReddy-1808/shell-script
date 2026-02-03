#!/bin/bash

set -e #Shell Script will be checking for errors, if errors it will exit

USER_ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -gt 0 ]; then
    echo -e " $R Please run this script with root user :) $N" | tee -a $LOGS_FILE
    exit 3;
fi

mkdir -p $LOGS_FOLDER

# tee command is used to write the output to a file as well as to the console
VALIDATE(){  
    if [ $1 -eq 0 ]; then
        echo -e "$2 ... $G SUCCESS $N" | tee -a $LOGS_FILE
    else 
        echo -e "$2 ... $R FAILURE $N" | tee -a $LOGS_FILE
fi
}

for package in $@ # How to run: sh 14-Install.sh nginx mysql nodejs
do
    dnf list installed $package &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package is not installed, installing now :)"
        dnf install $package  -y &>>$LOGS_FILE
        #VALIDATE $? "$package installation"
    else
        echo -e "$package already installed ....$Y SKIPPING $N"
    fi
done