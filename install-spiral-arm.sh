#!/usr/bin/env bash
rm -rf /var/opt/spiral-arm
mkdir /var/opt/spiral-arm
tar xzf spiralarm.tar.gz -C /var/opt/spiral-arm/
chmod 644 /var/opt/spiral-arm
chown root:root /var/opt/spiral-arm