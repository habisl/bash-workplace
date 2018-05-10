#!/bin/bash
# Simple script for calculating ping time

a=$(ping -c 1 example.com | grep 'bytes from' | cut -d = -f 4)
echo "The ping was $a"
