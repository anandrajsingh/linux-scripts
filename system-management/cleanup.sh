#!/bin/bash

echo "Starting cleanup"
sudo apt-get clean
echo "APT cache cleared"

sudo apt-get autoremove --purge
echo "Orphaned packages removed"

sudo journalctl --vacuum-size=50M
echo "Journal Logs cleared"
