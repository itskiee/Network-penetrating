#!/bin/bash

read -p "Enter the target domain: " domain
read -p "Enter the target IP: " ip

echo "1. WHOIS Information"
whois $domain > whois_info.txt
echo "Saved WHOIS info to whois_info.txt"

echo "2. DNS Information (nslookup)"
nslookup $domain > dns_info.txt
echo "Saved DNS info to dns_info.txt"

echo "3. Nmap Network Scan"
nmap -A $ip -oN nmap_scan.txt
echo "Saved Nmap scan to nmap_scan.txt"

echo "4. theHarvester OSINT Scan"
theHarvester -d $domain -b google -f theharvester_result
echo "theHarvester results saves as theharvester_result.xml and .html"

echo "5. Domain Info (dig)"
dig $domain ANY +noall +answer > dig_info.txt
echo "Saved dig output to dig_info.txt"
