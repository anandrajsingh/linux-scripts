#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root. Please use 'sudo'."
    exit 1
fi

read -p "Enter the IP address to block: " ip_to_block

if [ -z "$ip_to_block" ] then
    echo "IP address cannot be emtyp. Exiting"
    exit 1
fi

iptables -A INPUT -s "$ip_to_block" -j DROP 

if [ $? -eq 0 ]; then
    echo "Successfully blocked IP address: $ip_to_block"
    echo "To view the active rules, run: sudo iptables -L --line-numbers"
    echo "To remove this rule, find its line number and run: sudo iptables -D INPUT [line_number]"
else
    echo "Failed to add iptables rule. Please check the IP address and your permissions."
fi