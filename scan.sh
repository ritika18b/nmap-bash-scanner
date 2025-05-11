#!/bin/bash

# Simple Nmap Bash Scanner
echo "Welcome to Simple Nmap Bash Scanner"
read -p "Enter the target IP or domain: " target

# Create results directory if it doesn't exist
mkdir -p results

# File to save results
filename="results/${target}_scan.txt"
echo "Scanning host: $target"
echo "Results will be saved in $filename"

# Timestamp for logging
echo "Scan started at: $(date)" | tee -a "$filename"

# Ping Scan
echo -e "\n[+] Running Ping Scan..." | tee -a "$filename"
nmap -sn "$target" | tee -a "$filename"

# Port Scan
echo -e "\n[+] Running Port Scan..." | tee -a "$filename"
nmap -p- "$target" | tee -a "$filename"

# OS Detection and Service Version Detection
echo -e "\n[+] Running OS Detection and Service Version Scan..." | tee -a "$filename"
nmap -A "$target" | tee -a "$filename"

# Scan Completed
echo -e "\n[+] Scan completed at: $(date)" | tee -a "$filename"
echo -e "\nCheck the scan results at: $filename"
