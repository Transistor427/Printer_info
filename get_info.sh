#!/bin/sh



host=$(whoami)
board=$(uname -n)
os=$(uname -o)
kernel_rls=$(uname -r)

if [ -f /home/$host/klipper_config/printer.cfg ];
    then
        prt_conf=/home/$host/klipper_config/printer.cfg
    else
        prt_conf=($(find /home/$host/ -name printer.cfg))
fi

echo -n > /home/$host/Printer_info/info.txt
ID=($(cat $prt_conf | grep "ZBS" | cut -b 8-16))

cat $prt_conf | grep "position_max: 210"
if [ $? -eq 0 ];
    then
        echo "Model: S32" >> /home/$host/Printer_info/info.txt
    else
        echo "Model: S300" >> /home/$host/Printer_info/info.txt
fi


echo "S/N: $ID" >> /home/$host/Printer_info/info.txt
echo "User: $host" >> /home/$host/Printer_info/info.txt
echo "Board: $board" >> /home/$host/Printer_info/info.txt
echo "OS: $os" >> /home/$host/Printer_info/info.txt
echo "Kernel: $kernel_rls" >> /home/$host/Printer_info/info.txt
