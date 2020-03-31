#!/bin/bash

i="0"
while [ $i -lt 4 ]
do
clear
sudo ./OpenCorsairLink.elf --device 0
sleep 4
done
