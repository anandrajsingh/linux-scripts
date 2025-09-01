#!/bin/bash

echo "Top 10 processes by CPU usage"
ps aux --sort=-%cpu | head -n 11

echo ""

echo "Top 10 processes by Memory usage"
ps aux --sort=-%mem | head -n 11