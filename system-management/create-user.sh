#!/bin/bash

read -p "Enter new username: " username

if [ -z "$username" ]; then
    echo "Username cannot be empty. Exiting"
    exit 1
fi

if id "$username" &>/dev/null; then
    echo "User '$username' already exists. Exiting"
    exit 1
fi

useradd -m -s /bin/bash "$username"

if [ $? -eq 0 ]; then
    echo "User '$username' created successfully. Now set the password"
    passwd "$username"
else
    echo "Failed to create user '$username'"
fi

echo "User creation process finished"