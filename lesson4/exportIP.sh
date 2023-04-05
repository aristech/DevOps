#! /bin/bash
# This script will export the IP addresses
# from another file in the same directory

# check if the argument is empty
if [ -z "$1" ]
then
    echo "No argument supplied"
    exit 1
fi

# check if the argument is a file
if [ ! -f "$1" ]
then
    echo "The argument is not a file"
    exit 1
fi

# remove own ip address
ownIp='83.149.118.149'
ip=$(grep -Eo "([0-9]{1,3}[\.]){3}[0-9]{1,3}" "$1" | grep -v "$ownIp")

# remove duplicates
ip=$(echo "$ip" | sort -u)

# check if the variable is empty
if [ -z "$ip" ]
then
    echo "No ip address found"
    exit 1
fi

# export to file
echo "$ip" > ip.txt