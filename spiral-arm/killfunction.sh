#!/usr/bin/bash
function killblacklist {
if [[ "$SSHCOUNT" > "$SETLIMIT" ]]; then
    TOKILL=$(cat /var/opt/spiral-arm/black.pid)
    kill -9 $TOKILL
    echo Killed "$TOKILL" >> /tmp/ssh-kills 
else
    touch /tmp/ssh-limit
    echo "$SSHLIMIT" > /tmp/ssh-limit
fi
};
killblacklist
