#!/bin/bash

echo "===== CPU & Memory Usage ====="
echo "Timestamp: $(date)"

# Get CPU Load (macOS)
CPU_LOAD=$(sysctl -n vm.loadavg)

# Get Memory Usage (macOS)
MEM_TOTAL=$(sysctl -n hw.memsize | awk '{print $1 / 1024 / 1024}')
MEM_FREE=$(vm_stat | awk '/Pages free/ {print $3*4096/1024/1024}')
MEM_USED=$(echo "$MEM_TOTAL - $MEM_FREE" | bc)
MEM_PERCENT=$(echo "scale=2; $MEM_USED / $MEM_TOTAL * 100" | bc)

echo "CPU Load: $CPU_LOAD"
echo "Memory Usage: Used: ${MEM_USED}MB / ${MEM_TOTAL}MB (${MEM_PERCENT}%)"
echo "--------------------------------"

