#!/bin/bash

if ! command -v whois &> /dev/null; then
    echo "whois is not installed. Install it to run the script."
    exit 1
fi

read -p "Enter the domain name (e.g. google.com): " domain

if [ -z "$domain" ]; then
    echo "Domain cannot be empty. Exiting"
    exit 1
fi

whois "$domain"