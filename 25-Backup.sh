#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # 14 days is the default value, if the user not supplied

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE
}

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N"
    exit 1
fi

mkdir -p $LOGS_FOLDER

USAGE(){
    log "$R USAGE:: sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14 days] $N"
    exit 1
}


if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d "$SOURCE_DIR" ]; then
    log "$R Source Directory: $SOURCE_DIR does not exist $N"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
    log "$R Destination Directory:  $DEST_DIR does not exist $N"
    exit 1
fi

### Find the files
FILES=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +$DAYS) # -m is modification time

#Displaying details to user
log "Backup started"
log "Source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "Days: $DAYS"

if [ -z "${FILES}" ]; then  # -z is to check empty string
    log "No files to Archive ... $Y Skipping $N"
else
    log "Files found to Archive:\n $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz" #Inside destination folder :: app-logs-2024-06-15-12-30-45.tar.gz
    echo ""
    log "Archive name: $ZIP_FILE_NAME"
    tar -zcvf $ZIP_FILE_NAME $FILES &>>$LOGS_FILE

    # Check Archive is success or not then proceed to delete the source files
    if [ -f $ZIP_FILE_NAME ]; then
        log "Archive is ... $G SUCCESS $N"

        while IFS= read -r filepath; do
        # Process each line here
        rm -f $filepath
        log "$R Deleted file: $filepath $N"
        done <<< $FILES
    else
        log "Archeival is ... $R FAILURE $N"
        exit 1
    fi
fi