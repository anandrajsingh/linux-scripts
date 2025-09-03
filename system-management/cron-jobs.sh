#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root to access all cron jobs. Exiting"
    exit 1
fi

users=$(getent passwd | cut -d: -f1)

for user in $users; do
    echo "Crontab for user: $user"
    sudo crontab -l -u "$user" 2>/dev/null

    if [ $? -ne 0 ]; then
        echo "No crontab found for this user"
    fi
    echo ""
done

echo "=============================="
echo "Listing system-wide cron jobs"
echo "=============================="
echo ""

if [ -f "/etc/crontab" ]; then
    cat /etc/crontab
else
    echo "File not found: /etc/crontab"
fi
echo ""

echo "----------Files in /etc/cron.d/   -----------------"
if [ -d "/etc/cron.d" ]; then
    ls -l /etc/cron.d/
    for file in /etc/cron.d/*; do
        if [ -f "$file" ]; then
            echo "-------------------"
            echo "Contents of '$file'"
            cat $file
        fi
    done
else
    echo "Directory not found: /etc/cron.d"
fi
echo ""

cron_dirs=("/etc/cron.hourly" "/etc/cron.daily" "/etc/cron.weekly" "/etc/cron.monthly")

for dir in "${cron_dirs[@]}"; do
    echo "--- Files in $dir ---"
    if [ -d "$dir" ]; then
        ls -l "$dir"
    else
        echo "Directory not found: $dir"
    fi
    echo ""
done