#!/bin/bash

echo "==================="
echo "Network Information"
echo "==================="
echo ""

echo "---IPv4 Network Interfaces---"
ip -4 -br addr
echo ""

echo "---IPv6 Network Interfaces---"
ip -6 -br addr
echo ""

echo "---Default Gateway and Raoutes---"
ip route show
echo ""

echo "---Internet Connectivity Test---"
ping -c 4 8.8.8.8
echo ""