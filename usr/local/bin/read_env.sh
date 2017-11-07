#!/bin/sh

if [ -z "$1" ]; then 
    echo "You need to set the env file";
    return 1 
fi

eval $(ansible-vault view $1)
