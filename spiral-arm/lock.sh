#!/usr/bin/bash
# This will lock the current ssh hits and kill all new ones.
while true; do bash ssh-limit.sh ; done 2> /dev/null
