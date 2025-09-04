#!/bin/bash

echo "------------- ARP Table (ip neigh) -----------"

ip neigh

echo ""
echo "----------------------------------------"
echo "Columns Explained:"
echo "IP Address (e.g., 192.168.1.1)"
echo "MAC Address (e.g., aa:bb:cc:dd:ee:ff)"
echo "state: 'STALE' means the entry is old, 'REACHABLE' means it's current."
echo "----------------------------------------"