#!/bin/bash

echo "Memory Usage Summary (free -h)"
free -h

echo ""

echo "Detailed memory information (/proc/meminfo)"
cat /proc/meminfo