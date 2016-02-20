#!/usr/bin/env bash
ps aux | grep ssh | grep -v grep | awk '{print $2}'> /opt/spiral-arm/whitelist
chown root:root /opt/spiral-arm/whitelist
chown root:root /opt/spiral-arm
