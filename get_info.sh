#!/bin/sh
log_work=1

host=$(whoami)

if [ -f /home/$host/klipper_config/printer.cfg ];
    then
        klp_conf=/home/$host/klipper_config/printer.cfg
    else
        klp_conf=($(find /home/$host/ -name printer.cfg))
fi

ID=($(cat $klp_conf | grep "ZBS" | cut -b 8-16))
if [ $log_work == 1 ]; then echo "Get S/N."
fi

echo $ID >> info.txt

