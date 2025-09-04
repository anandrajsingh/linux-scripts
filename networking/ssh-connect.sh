#!/bin/bash

SSH_USER="your_username"
SSH_SERVER="your_server_ip_or_domain"

echo "         Quick SSH to Server"
echo ""


if ! command -v ssh &> /dev/null; then
    echo "Error: 'ssh' command not found. Please ensure OpenSSH client is installed."
    exit 1
fi

echo "Attempting to connect to $SSH_USER@$SSH_SERVER..."
echo "----------------------------------------"


ssh "$SSH_USER@$SSH_SERVER"

if [ $? -ne 0 ]; then
    echo ""
    echo "Error: SSH connection failed. Check your network, server address, or user credentials."
fi
