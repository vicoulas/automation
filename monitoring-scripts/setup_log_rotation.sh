#!/bin/bash

CONFIG_FILE="/etc/newsyslog.d/system_monitor.conf"

echo "Setting up log rotation for system_monitor.log..."

# Check if the config already exists
if [[ -f "$CONFIG_FILE" ]]; then
    echo "Log rotation is already configured."
    exit 1
fi

# Add log rotation rule
echo "/var/log/system_monitor.log    640  7   *    @T00  J   /var/log/system_monitor.log" | sudo tee "$CONFIG_FILE"

# Restart newsyslog to apply changes
sudo killall -HUP syslogd

echo "Log rotation setup completed!"

