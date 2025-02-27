#!/bin/bash

LOG_FILE="/var/log/system_monitor.log"

echo "===== CPU & Memory Usage =====" | tee -a "$LOG_FILE"
echo "Timestamp: $(date)" | tee -a "$LOG_FILE"

CPU_LOAD=$(sysctl -n vm.loadavg)
MEM_TOTAL=$(sysctl -n hw.memsize | awk '{print $1 / 1024 / 1024}')
MEM_FREE=$(vm_stat | awk '/Pages free/ {print $3*4096/1024/1024}')
MEM_USED=$(echo "$MEM_TOTAL - $MEM_FREE" | bc)
MEM_PERCENT=$(echo "scale=2; $MEM_USED / $MEM_TOTAL * 100" | bc)

echo "CPU Load: $CPU_LOAD" | tee -a "$LOG_FILE"
echo "Memory Usage: Used: ${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)" | tee -a "$LOG_FILE"
echo "--------------------------------" | tee -a "$LOG_FILE"

