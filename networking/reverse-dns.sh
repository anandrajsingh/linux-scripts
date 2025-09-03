#!/bin/bash

if ! command -v dig &> /dev/null; then
    echo "Error: 'dig' is not installled. Please install it to run the script"
    exit 1
fi

read -p "Enter the IP address (e.g. 8.8.8.8): " ip_address

if [ -z "$ip_address" ]; then
    echo "IP address cannot be empty. Exiting"
    exit 1
fi

echo "-------------- Resolving IP address $ip_address to domain name ---------------"

domain_name=$(dig -x "$ip_address" +short)

if [ -n "$domain_name" ]; then
    clean_domain=${domain_name%.}
    echo "Domain Name: $clean_domain"
else
    echo "Could not resolve the IP address to a domain name."
fi