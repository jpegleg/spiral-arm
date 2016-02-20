#!/usr/bin/env bash
rm -rf /opt/spiral-arm
mkdir /opt/spiral-arm
tar xzf spiralarm.tar.gz -C /opt/spiral-arm/
chmod 644 /opt/spiral-arm
chown root:root /opt/spiral-arm
