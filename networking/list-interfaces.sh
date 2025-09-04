#!/bin/bash

if ! command -v ip &> /dev/null; then
    echo "Error: The 'ip' command was not found."
    echo "Please ensure the iproute2 package is installed on your system."
    exit 1
fi

ip -brief a | grep -v "lo"

echo "---------- Detailed Information ---------"
ip a