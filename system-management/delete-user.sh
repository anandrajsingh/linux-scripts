#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root. Exiting"
    exit 1
fi

read -p "Enter the username you want to delete: " username

if [ -z "$username" ]; then
    echo "Username cannot be empty. Exiting"
    exit 1
fi

if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist. Nothing to delete."
    exit 1
fi

read -p "Are you sure you want to delete user "$username" and their home directory? (y/n): " confirmation
if [[ ! "$confirmation" =~ ^[Yy]$ ]]; then
    echo "Operation cancelled. Exiting."
    exit 0
fi

echo "Deleting user '$username' and their home directory..."
userdel -r "$username"

if [ $? -eq 0 ]; then
    echo "User '$username' and their home directory have been successfully removed"
else
    echo "Failed to delete user '$username'."
fi