#!/bin/bash

set -e #ERR

trap 'echo "There is an error in LINE NUMBER: $LINENO, Command: $BASH_COMMAND"' ERR
# ERR it self is the exit code

echo "Hello World"
echo "I am learning Shell"
echoo "printing error here"
echo "No error in this"