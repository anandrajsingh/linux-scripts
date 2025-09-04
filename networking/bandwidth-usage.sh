#!/bin/bash

if ! command -v iftop &> /dev/null; then
    echo "Error: 'iftop' is not installed."
    echo "Please install it using your package manager (e.g., sudo apt-get install iftop)."
    exit 1
fi

echo "-------- Available Network Interfaces ------------"
ip -brief a | grep -v "lo"

read -p "Enter the interface to monitor (e.g., eth0, wlan0): " interface

if [ -z "$interface" ]; then
    echo "No interface specified. Exiting"
    exit 1
fi

if ! ip link show "$interface" &> /dev/null; then
    echo "Error: Interface "$interface" not found"
    echo 1
fi

echo ""
echo "Starting bandwidth monitoring on '$interface'. Press 'q' to quit."
echo "You may need to run this script with 'sudo' for full functionality."
echo "========================================"
echo ""

sudo iftop -i "$interface" -P -N