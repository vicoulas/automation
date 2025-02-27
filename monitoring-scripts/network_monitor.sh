#!/bin/bash

echo "===== Active Network Connections ====="
netstat -an | grep ESTABLISHED

