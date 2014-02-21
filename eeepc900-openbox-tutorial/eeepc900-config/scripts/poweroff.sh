#!/bin/sh
echo -n "Do you really want to shutdown?";
read yorn;
if test "$yorn" = "y"; then
    sudo poweroff;
else
    echo "Shutdown Aborted.";
fi
