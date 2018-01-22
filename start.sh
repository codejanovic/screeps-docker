#!/bin/sh
# config check
cd /screeps

if [ ! -e /screeps/.screepsc ]; then
    if [ -z "$STEAMKEY" ]; then
        echo "Did you forget to set the STEAMKEY environment variable?"
        exit 1
    else        
        # pass our steam key into the init process
        echo "initializing screeps..."
        echo "${STEAMKEY}" | screeps init
    fi
fi

screeps start