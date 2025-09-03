#!/bin/bash

if ! command -v speedtest &> /dev/null; then
    echo "Error: 'speedtest-cli' is not installed."
    echo "Please install it with one of the following commands (or your package manager's equivalent):"
    echo "  - sudo apt-get install speedtest-cli"
    echo "  - sudo yum install speedtest-cli"
    echo "  - sudo dnf install speedtest-cli"
    exit 1
fi

echo "Running speed test... This may take a moment."

speedtest --accept-license --accept-gdpr