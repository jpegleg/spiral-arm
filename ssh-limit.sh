#!/usr/bin/env bash
# Limit ssh sessions on the system with checks
# and process termination.

# Set the ssh hit limit

SETLIMIT=$(cat /etc/ssh-limit.cfg)

# Set ignored pids to NULL 

IGNOREPROC1=NULL
IGNOREPROC2=NULL
IGNOREPROC3=NULL

# Count the ssh hits.

SSHCOUNT=$(ps aux | grep ssh | grep -v grep | grep -v ssh-limit.sh | grep -v $IGNOREPROC1 | grep -v $IGNOREPROC2 | grep -v $IGNOREPROC3 | awk '{print $2}'| wc -l) 

# A function to kill off pids from the blacklist.
function killblacklist {
if [[ "$SSHCOUNT" -gt "$SETLIMIT" ]]; then
    TOKILL=$(cat /opt/spiral-arm/black.pid)
    kill -9 $TOKILL
    echo Killed "$TOKILL" >> /tmp/ssh-kills 
else
    touch /tmp/ssh-limit
    echo "$SSHLIMIT" > /tmp/ssh-limit
    chmod 655 /tmp/ssh-limit
    chown nobody:nobody /tmp/ssh-limit
fi
}

killblacklist
