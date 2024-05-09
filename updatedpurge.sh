#!/bin/bash
 
logfile="/var/log/esdl.log"
size_logfile="/var/log/size_logfile.txt"
 
# Check if the file exists
 
if [ -f "$logfile" ]; then
 
    # Get the size of the file
    last_size=$(du -h "$logfile" | cut -f1)

    # Get the current date
    current_date=$(date +"%Y-%m-%d %H:%M:%S")
 
    # Append the date and size to the size logfile
    echo "$current_date - $last_size" >> "$size_logfile"
 
    # Purge the file
    sudo cat /dev/null > "$logfile"
 
    echo "File $logfile purged. Size written to $size_logfile."
 
else
 
    echo "File $logfile does not exist."
 
fi