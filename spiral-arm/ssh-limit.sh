#!/usr/bin/bash
# Limit ssh sessions on the system with checks
# and process termination.

# Set the maximum processes containing key word "ssh"

SETLIMIT=16

# Set ignored pids to NULL 

IGNOREPROC1=NULL
IGNOREPROC2=NULL
IGNOREPROC3=NULL

# Clear the blacklist
touch /var/opt/spiral-arm/black.pid

# Count the ssh hits and store the pids to a file and variable.

SSHPS=$(ps aux | grep ssh | grep -v grep | grep -v ssh-limit.sh | grep -v $IGNOREPROC1 | grep -v $IGNOREPROC2 | grep -v $IGNOREPROC3 | awk '{print $2}') 

for x in $SSHPS; do 
    echo $x >> /var/opt/spiral-arm/ssh-count.out; 
done;

SSHCOUNT=$(cat /var/opt/spiral-arm/ssh-count.out | wc -l) 

# A function to create a blacklist
function createblacklist { 
    ps aux | grep ssh | grep -v grep | grep -v root | awk '{print $2}' > /var/opt/spiral-arm/blacklist
    BLACKPIDS=$(diff /var/opt/spiral-arm/whitelist  /var/opt/spiral-arm/blacklist | grep "\> *" | grep -v "<" | awk '{print $2}')
    echo $BLACKPIDS > /var/opt/spiral-arm/black.pid
}
# A function to kill off pids from the blacklist.
function killblacklist {
if [ "$SSHCOUNT" -gt "$SETLIMIT" ]; then
    TOKILL=$(cat /var/opt/spiral-arm/black.pid)
    kill -9 $TOKILL
    echo Killed "$TOKILL" >> /tmp/ssh-kills 
else
    touch /tmp/ssh-limit
    echo "$SSHLIMIT" > /tmp/ssh-limit
    chmod 655 /tmp/ssh-limit
    chown nobody:nobody /tmp/ssh-limit
fi
}

# A function to create a whitelist of pids not to kill.
function createwhitelist {
    ps aux | grep ssh | grep -v grep | awk '{print $2}'> /var/opt/spiral-arm/whitelist
    chown root:root /var/opt/spiral-arm/whitelist
    chown root:root /var/opt/spiral-arm
}

# Set the whitelist.
createwhitelist

# Get the sessions to kill by count

if [ "$SSHCOUNT" -gt "$SETLIMIT" ]; then
    createblacklist
    killblacklist
else
    createwhitelist
fi
   
# Set the session to kill by blacklist only and always.
# This alternative to the count will kill any 
# process with ssh returned from ps that
# is not on the whitelist.

SETLIMIT=0; createblacklist ; killblacklist 
rm -f /var/opt/spiral-arm/ssh-count.out
