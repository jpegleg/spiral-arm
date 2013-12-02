#!/usr/bin/bash
rm -rf /var/opt/spiral-arm
mkdir /var/opt/spiral-arm
tar xzf spiralarm.tar.gz -C /var/opt/spiral-arm/
chmod 644 /var/opt/spiral-arm
chown root:root /var/opt/spiral-arm
chmod +x /var/opt/spiral-arm/ssh-limit.sh
chmod +x /var/opt/spiral-arm/lock.sh
