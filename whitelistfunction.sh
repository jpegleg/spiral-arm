#!/usr/bin/env bash
ps aux | grep ssh | grep -v grep | awk '{print $2}'> /var/opt/spiral-arm/whitelist
chown root:root /var/opt/spiral-arm/whitelist
chown root:root /var/opt/spiral-arm
