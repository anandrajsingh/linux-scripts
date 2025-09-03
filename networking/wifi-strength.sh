#!/bin/bash

if ! command -v nmcli &> /dev/null; then
    echo "Error: 'nmcli' is not installed. This script requires NetworkManager."
    echo "Please install it to run this script."
    exit 1
fi

nmcli -t -f SSID,SIGNAL,BSSID dev wifi list | sort -t: -k2 -nr