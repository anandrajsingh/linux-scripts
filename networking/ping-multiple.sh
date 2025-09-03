#!/bin/bash

hosts=("google.com" "8.8.4.4" "invalid_host" "127.0.0.1")

for host in "${hosts[@]}"; do
    echo "Pinging "$host"...."
    
    if ping -c 1 "$host" &> /dev/null; then
        echo "--> $host is reachable."
    else
        echo "--> $host is not reachable."
    fi
    echo ""
done