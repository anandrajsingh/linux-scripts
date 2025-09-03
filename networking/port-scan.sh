#!/bin/bash

if ! command -v nc &> /dev/null; then
    echo "Error nc(netcat) command not installed. Please install it to run this script."
    echo "(eg. sudo apt-get install netcat or sudo yum install nc)"
    exit 1
fi

read -p "Enter the target host (e.g. example.com or 192.168.1.1: )" host

if [ -z "$host" ]; then
    echo "Host cannot be empty. Exiting"
    exit 1
fi

echo "Enter the port(s) to scan."
echo "Examples: 80 (single port), 20-100 (range), 22,80,443 (multiple ports)"
read -p "Enter port(s) or range: " ports

if [ -z "$ports" ]; then
    echo "Port(s) cannot be emty. Exiting"
    exit 1;
fi

echo ""
echo "------- Scanning Host --------"
if [[ "$ports" == *","* ]]; then
    IFS="," read -r -a port_array <<< "$ports"
    for port in "${port_array[@]}"; do
        port=$(echo "$port" | tr -d '[:space:]')
        if nc -vz -w 1 "$host" "$port" &>/dev/null; then
            echo "Port $port is OPEN"
        else
            echo "Port $port is CLOSED"
        fi
    done
elif [[ "$ports" == *"-"* ]]; then
    start_port=$(echo "$ports" | cut -d'-' -f1)
    end_port=$(echo "$ports" | cut -d'-' -f2)

    if ! [[ "$start_port" =~ ^[0-9]+$ && "$end_port" =~ ^[0-9]+$ ]]; then
        echo "Invalid port range format. Exiting."
        exit 1
    fi

    for port in $(seq "$start_port" "$end_port"); do
        if nc -vz -w 1 "$host" "$port" &>/dev/null; then
            echo "Port $port is OPEN"
        else
            echo "Port $port is CLOSED"
        fi
    done
elif [[ "$ports" =~ ^[0-9]+$ ]]; then
    if nc -vz -w 1 "$host" "$ports" &>/dev/null; then
        echo "Port $ports is OPEN"
    else
        echo "Port $ports is CLOSED"
    fi

else
    echo "Invalid port format. Please use a single number, a range (e.g., 20-100), or a comma-separated list."
    exit 1
fi