#!/bin/bash

NAME=MANI

echo "Name is: $NAME"
echo "PID of Script-1: $$"

#sh 22-Script-2.sh   # Seperate PID, can't access other script variables
./22-Script-2.sh     # Same PID, CAN access other scrit variables