#!/usr/bin/env bash
ps aux | grep ssh | grep -v grep | grep -v root | awk '{print $2}' > /var/opt/spiral-arm/blacklist
BLACKPIDS=$(diff /var/opt/spiral-arm/whitelist  /var/opt/spiral-arm/blacklist | grep "\> *" | grep -v "<" | awk '{print $2}')
echo $BLACKPIDS > /var/opt/spiral-arm/black.pid
