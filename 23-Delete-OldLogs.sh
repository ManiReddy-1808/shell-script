#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGS_FOLDER=/d/DevSecOps/logs
LOGS_FILE=$LOGS_FOLDER/$0.log

if [ ! -d $LOGS_FOLDER ]; then
    echo -e "$R $LOGS_FOLDER does not exist $N" | tee -a $LOGS_FILE
    exit 4;
fi

FILES_TO_DELETE=$(find $LOGS_FOLDER -type f -name "*.log" -mtime +14)

while IFS= read -r filepath; do
    # Process each filename stored in the $filepath variable
    rm -f $filepath
    echo -e "$G Deleted file is: $filepath $N" | tee -a $LOGS_FILE
done <<< $FILES_TO_DELETE