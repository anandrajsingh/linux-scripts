#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root. Please use 'sudo'."
    exit 1
fi

if ! command -v iptables &> /dev/null
    echo "Error: iptables is not installed"
    echo "Please insure that iptables package is installed on your system."
    exit 1
fi

read -p "Enter the ip address to unblock: " ip_to_unblock

if [ -z "$ip_to_unblock" ]; then 
    echo "IP address cannot be empty. Exiting"
    exit 1
fi

echo "Attempting to remove iptables rule for $ip_to_unblock..."
iptables -D INPUT -s "$ip_to_unblock" -j DROP

if [ $? -eq 0 ]; then
    echo "Successfully unblocked IP address: $ip_to_unblock"
    echo "The rule has been removed from the INPUT chain."
else
    echo "Failed to remove the iptables rule. This may be because:"
    echo "  - The rule for $ip_to_unblock did not exist."
    echo "  - The rule was not in the INPUT chain or did not use -j DROP."
fi