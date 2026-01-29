#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 0 ]; then
    echo "$NUMBER is +ve number"
elif [ $NUMBER -lt 0 ]; then
    echo "$NUMBER is -ve number"
else
    echo "$NUMBER is exactly equal's to ZERO"
fi

# -gt -> greater than
# -lt -> less than
# -eq -> equal
# -ne -> not equal