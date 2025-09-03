#!/bin/bash

echo "System Hardware Info"
echo ""

echo "---RAM Usage---"
free -h
echo ""

echo "---Display Usage---"
top -bn1 | head -n4
echo ""

echo "---Disk Space Usage---"
df -h