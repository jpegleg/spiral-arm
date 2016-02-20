#!/usr/bin/env bash
ps aux | grep ssh | grep -v grep | grep -v root | awk '{print $2}' > /opt/spiral-arm/blacklist
BLACKPIDS=$(diff /opt/spiral-arm/whitelist  /opt/spiral-arm/blacklist | grep "\> *" | grep -v "<" | awk '{print $2}')
echo $BLACKPIDS > /opt/spiral-arm/black.pid
