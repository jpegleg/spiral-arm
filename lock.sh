#!/usr/bin/env bash
# This will lock the current ssh hits and kill all new ones.
while true; do bash /var/opt/spiral-arm/ssh-limit.sh ; done 2> /dev/null
