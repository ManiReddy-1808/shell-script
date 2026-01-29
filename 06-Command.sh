#!/bin/bash

START_TIME=$(date +%s)
echo "Script started executing at: $START_TIME"

sleep 10

END_TIME=$(date +%s)
echo "Script exited at: $END_TIME"

TOTAL_TIME=$(($END_TIME - $START_TIME))

echo "Script executed in: $TOTAL_TIME seconds"