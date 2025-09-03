#!/bin/bash

echo "--------- Network Route Tracer ----------"

if ! command -v traceroute &> /dev/null; then
    echo "Error: 'traceroute' is not installed. Please install it to run the script."
    echo "(e.g. sudo apt-get install traceroute or sudo yum install traceroute)"
    exit 1
fi

read -p "Enter the target host or IP addresses: " host

if [ -z "$host" ]; then
    echo "Host cannot be empty. Exiting"
    exit 1
fi

echo "--------- Tracerouting Host ------------"
traceroute "$host"