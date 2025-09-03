#!/bin/bash

echo "---- Local IP Addresses ----"

local_ips=$(hostname -I | tr ' ' '\n')

if [ -n "$local_ips" ]; then
    echo "$local_ips"
else
    echo "No local IP addresses found"
fi
echo ""

echo "---- Public IP Addresses ----"
if ! command -v curl &> /dev/null; then
    echo "Error: 'curl' is not installed. Please install it to get the public IP."
    echo "(e.g. sudo apt-get install curl or sudo yum install curl)"
else
    public_ip=$(curl -s icanhazip.com)

    if [ -n "$public_ip" ]; then
        echo "$public_ip"
    else
        echo "Could not retrieve pulic ip addresses"
    fi
fi
