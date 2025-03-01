# System Monitoring Automation on macOS

## Overview

This project automates system monitoring tasks on macOS using Bash scripts. 
It collects system metrics (CPU, memory, disk usage, network connections) at regular intervals and logs the data. 
Additionally, it uses newsyslog for log rotation to preven excessive log growth.

### Monitoring Scripts

The following scripts collect system metrics:

- cpu_mem_monitor.sh

Monitors CPU and memory usage.

Outputs data to /var/log/system_monitor.log.

- disk_monitor.sh

Tracks disk usage and free space.

- network_monitor.sh

Lists active network connections.

Can be modified to detect unknown connections.


### Log Rotation Setup

To enable automatic log rotation for `system_monitor.log`, run:

chmod +x setup_log_rotation.sh
./setup_log_rotation.sh

##
