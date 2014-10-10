#!/bin/bash
#This small shell script performs an nmap discovery scan against the local subnet and saves the output to a file
#./netmap.sh No args
#outchea'

TARGETS=$(nmap -iflist | grep eth0 | cut -d " " -f4)
#Creates $TARGETS variable and assigns eth0 subnet


FNAME=$(date -Iseconds).nmap.out
#Creates $FNAME variable for filename and assigns seconds based time-stamp


NMAP=$(which nmap)
#Creates $NMAP variable which points to it's absolute path


$NMAP -T4 -A -g 53 -v --reason --stats-every 10s "$TARGETS" -oN "$FNAME"
#Runs the generated command from source port 53 and saves the output to a time-stamped file

echo less "$FNAME"
#Gives the user a copy/paste option to view the report






