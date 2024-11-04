#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.


export HOME=/config

PIDS=

notify() {
    for N in $(ls /etc/logmonitor/targets.d/*/send)
    do
       "$N" "$1" "$2" "$3" &
       PIDS="$PIDS $!"
    done
}


# Wait for all PIDs to terminate.
set +e
for PID in "$PIDS"; do
   wait $PID
done
set -e

#/usr/bin/brave --version
#exec /usr/bin/brave "$@" >> /config/log/firefox/output.log 2>> /config/log/firefox/error.log
export $(dbus-launch)
flatpak run com.brave.Browser
# vim:ft=sh:ts=4:sw=4:et:sts=4
