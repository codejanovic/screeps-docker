#!/bin/sh
# config check
cd /screeps

if [ ! -e /screeps/.screepsrc ]; then
    if [ -z "$STEAMKEY" ]; then
        echo "Did you forget to set the STEAMKEY environment variable?"
        exit 1
    else        
        # pass our steam key into the init process
        echo "initializing screeps..."
        echo "${STEAMKEY}" | screeps init

        echo "initializing mods..."
        npm install screepsmod-mongo screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features        

        echo "initializing .screepsrc..."
       
        echo "\n[mongo]" >> .screepsrc 
        echo "host=${MONGO_LINK}" >> .screepsrc
        echo "[redis]" >> .screepsrc
        echo "host=${REDIS_LINK}" >> .screepsrc    
        sed 's/modfile.*/modfile = custom_mods.json/' .screepsrc
    fi
fi

screeps start