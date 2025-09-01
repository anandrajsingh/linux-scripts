#!/bin/bash

echo "CPU usage check...."
top -bn1 | head -n 20

echo ""

echo "Detailed per-core information"
mpstat -P ALL
