#!/bin/bash

set -e #Shell Script will be checking for errors, if errors it will exit
trap 'echo "There is an error in LINE NUMBER: $LINENO, Command: $BASH_COMMAND"' ERR

# This will show only error's if any 

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

for package in $@ # How to run: sh 14-Install.sh nginx mysql nodejs
do
    dnf list installed $package &>>$LOGS_FILE   
    if [ $? -ne 0 ]; then
        echo "$package is not installed, installing now :)"
        dnf install $package  -y &>>$LOGS_FILE
    else
        echo -e "$package already installed ....$Y SKIPPING $N"
    fi
done