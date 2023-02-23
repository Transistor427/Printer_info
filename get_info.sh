#!/bin/sh

host=$(whoami)
board=$(uname -n)
os=$(uname -o)
kernel_rls=$(uname -o)

if [ -f /home/$host/klipper_config/printer.cfg ];
    then
        prt_conf=/home/$host/klipper_config/printer.cfg
    else
        prt_conf=($(find /home/$host/ -name printer.cfg))
fi

echo -n > /home/$host/Printer_info/info.txt
echo "Get Hostname printer."
echo "Hostname: $host" >> /home/$host/Printer_info/info.txt

ID=($(cat $prt_conf | grep "ZBS" | cut -b 8-16))
echo "S/N: $ID" >> /home/$host/Printer_info/info.txt
echo "User: $host" >> /home/$host/Printer_info/info.txt
echo "Board: $board" >> /home/$host/Printer_info/info.txt
echo "OS: $os" >> /home/$host/Printer_info/info.txt
echo "Kernel: $kernel_rls" >> /home/$host/Printer_info/info.txt
