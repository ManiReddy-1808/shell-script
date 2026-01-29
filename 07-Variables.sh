#!/bin/bash

### Special Variables ###
echo "All variables treat seperately: $@"
echo "All variables at treat at once: $*"
echo "Script name: $0"
echo "Exit status of previous command: $?"
echo "PID of this script: $$"
sleep 5 &
echo "PID of recently executed Background Process $!"
echo "Present Working Directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Who is running: $USER"