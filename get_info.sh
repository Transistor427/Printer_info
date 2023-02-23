#!/bin/sh

host=$(whoami)

if [ -f /home/$host/klipper_config/printer.cfg ];
    then
        prt_conf=/home/$host/klipper_config/printer.cfg
    else
        prt_conf=($(find /home/$host/ -name printer.cfg))
fi

ID=($(cat $prt_conf | grep "ZBS" | cut -b 8-16))
echo "Get S/N."

echo -n > /home/$host/Printer_info/info.txt
echo "Serial Numder: $ID" >> /home/$host/Printer_info/info.txt


