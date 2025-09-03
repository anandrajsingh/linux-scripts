#!/bin/bash

if ! command -v dig &> /dev/null; then
    echo "Error: 'dig' is not installed. Please install it to run the script."
    exit 1
fi

read -p "Enter the domain name: " domain

if [ -z "$domain" ]; then
    echo "Domain cannot be empty. Exiting"
    exit 1
fi

echo "---------- Resolving Domain --------"
ip_address=$(dig A +short "$domain")

if [ -n "$ip_address" ]; then
    echo "IP Adress: $ip_address "
else
    echo "Could not resolve this domain to ip address."
fi