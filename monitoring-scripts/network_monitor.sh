#!/bin/bash

LOG_FILE="/var/log/system_monitor.log"

echo "===== Active Network Connections =====" | tee -a "$LOG_FILE"
netstat -an | grep ESTABLISHED | tee -a "$LOG_FILE"
echo "--------------------------------" | tee -a "$LOG_FILE"

