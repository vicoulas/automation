#!/bin/bash

LOG_FILE="/var/log/system_monitor.log"
THRESHOLD=80


echo "===== Disk Space Usage =====" | tee -a "$LOG_FILE"

df -h | awk '{if ($5+0 > 80) print $0}' | tee -a "$LOG_FILE"
echo "--------------------------------" | tee -a "$LOG_FILE"




