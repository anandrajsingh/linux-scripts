#!/bin/bash

if ! command -v systemctl &>/dev/null; then
    echo "Systemctl command not found. This script is intended for systemd based systems."
    exit 1
fi

echo "Listing all active services"

echo ""

systemctl list-units --type=service --state=running --no-pager
