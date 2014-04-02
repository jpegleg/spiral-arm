#!/usr/bin/bash
# Read user input to set the max ps returned ssh
# programs excluding those run by user root.
echo "What would you like the ssh limit to be?"
echo "Type a positive number or 0 and hit enter please."
read SETMAX
echo Setting $SETMAX;
if [[ $SETMAX == "NULL" ]]; then
    cp /var/opt/spiral-arm/zero-limit.cfg /var/opt/spiral-arm/ssh-limit.sh
    echo "Using config /var/opt/spiral-arm/zero-limit.cfg to drop to zero li
mit."
else
    head -6 /var/opt/spiral-arm/ssh-limit.sh > /var/opt/spiral-arm/tmp.setscript
    echo SETLIMIT=$SETMAX >> /var/opt/spiral-arm/tmp.setscript
    tail -52 /var/opt/spiral-arm/ssh-limit.sh >> /var/opt/spiral-arm/tmp.setscript
    cp /var/opt/spiral-arm/tmp.setscript /var/opt/spiral-arm/ssh-limit.sh
fi
