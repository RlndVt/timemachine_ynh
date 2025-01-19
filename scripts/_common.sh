#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

samba_sysadmin_setup () {
    if [[ -d /etc/smb/smb.d ]]
    then
        echo "/etc/smb/smb.d exists on your filesystem."
    else
        mkdir -p /etc/smb/smb.d
    fi
}

samba_sysadmin_update () {
    # Update the smb.conf file
    ls /etc/smb/smb.d/* | sed -e 's/^/include = /' > /etc/smb/includes.conf
}

samba_sysadmin_add () {
    if grep -R "include = /etc/sdmb/includes.conf" /etc/samba/smb.conf
    then
        echo "The includes.conf file is already present in your smb.conf file."
    else
        echo "include = /etc/smb/includes.conf" >> /etc/samba/smb.conf
    fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

time_machine_activate_max_size () {
    if [ -z "$max_size" ]; then
        echo "The variable max_size is either not set or empty."
        if [ -z "${max_size+x}" ]; then
            echo "The variable max_size does not exist."
        else
            echo "The variable max_size is empty."
        fi
    else
        echo "The variable max_size exists."
    fi

    local max_size=$1;
    local time_machine_config_path=$2
    if [[ ! $max_size =~ ^[0-9]+$ ]] || [ "$var" -le 0 ]; then
        echo "max_size is either not a number or not greater than 0."
        return 0
    else
        echo "max_size is a number and greater than 0."
    fi
    sed -i '/^    # fruit:time machine max size = [0-9]\+G$/s/# //' $time_machine_config_path
}

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
