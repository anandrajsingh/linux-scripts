#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root to access system logs. Exiting"
    exit 1
fi

show_options(){
    echo "Common log options:"
    echo "1. System logs"
    echo "2. Authentication logs"
    echo "3. Kernel logs"
    echo "4. Apache error logs"
    echo "5. Nginx error logs"
    echo "6. Custom log file"
    echo ""
}

show_options
read -p "Enter the number for the log to monitor, or enter the full path to a custom log file: " choice

logfile=""

case "$choice" in
    1)
        if [ -f "/var/log/syslog" ]; then
            logfile="/var/log/syslog"
        elif [ -f "/var/log/messages" ]; then
            logfile="/var/log/messages"
        else
            echo "System log file not found. Exiting."
            exit 1
        fi
        ;;
    2)
        logfile="/var/log/auth.log"
        ;;
    3)
        logfile="/var/log/kern.log"
        ;;
    4)
        logfile="/var/log/apache2/error.log"
        ;;
    5)
        logfile="/var/log/nginx/error.log"
        ;;
    6)
        read -p "Enter the full path to the custom log file: " custom_path
        logfile="$custom_path"
        ;;
    *)
        logfile="$choice"
        ;;
esac

if [ ! -f "$logfile" ]; then
    echo "Error: The specified log file '$logfile' does not exist or is not a regular file . Exiting"
    exit 1
fi

echo ""
echo "Monitoring log file"
echo "---------------------------------------------"
tail -f "$logfile"