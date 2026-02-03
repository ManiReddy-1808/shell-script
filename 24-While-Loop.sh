#!/bin/bash
count=1

while [ $count -lt 6 ]
do
    echo "Count is: $count"
    sleep 1
    ((count++))
done
