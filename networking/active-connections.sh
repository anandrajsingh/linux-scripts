#!/bin/bash

if ! command -v ss &> /dev/null; then
    echo "Error: The 'ss' command was not found"
    echo "Please ensure that iproute package is installed on your system."
    exit 1
fi

echo "------ Active TCP connections ----------"
ss -tuanp

echo "------ Active UDP connections ----------"
ss -uanp