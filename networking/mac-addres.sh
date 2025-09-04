#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as sudo. Please use 'sudo' to run this script."
    exit 1
fi

if ! command -v ip &> /dev/null; then
    echo "Error: 'ip' command not found. Please ensure tha iproute2 is installed."
    exit 1;
fi

echo "Current network interfaces and their MAC addreses:"
ip a | grep 'ether' | awk '{print " Interface: " $2, " | MAC Addresses: " $4}'


read -p "Enter the interface name (e.g., eth0, wlan0): " interface
if [ -z "$interface" ]; then
    echo "Interface name cannot be empty. Exiting."
    exit 1
fi


if ! ip link show "$interface" &> /dev/null; then
    echo "Error: Interface '$interface' does not exist. Exiting."
    exit 1
fi


read -p "Enter the new MAC address (e.g., 00:11:22:33:44:55): " new_mac
if [ -z "$new_mac" ]; then
    echo "New MAC address cannot be empty. Exiting."
    exit 1
fi


ip link set dev "$interface" down

ip link set dev "$interface" address "$new_mac"

ip link set dev "$interface" up

echo "-------Verification -------"
ip a show "$interface" | grep 'ether'

if ip a show "$interface" | grep -q "$new_mac"; then
    echo "Success: MAC address for '$interface' has been changed."
else
    echo "Error: Failed to change MAC address for '$interface'."
fi