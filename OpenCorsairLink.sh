#!/bin/bash

cd /home/wyrms/bin/OpenCorsairLink/
sudo ./OpenCorsairLink.elf --device=0 --fan channel=1,mode=6,temps=31:33:36:38,speeds=30:55:65:100 
sudo ./OpenCorsairLink.elf --device=0 --fan channel=0,mode=6,temps=31:33:36:38,speeds=30:55:65:100 --led channel=0,mode=5,colors=00FF00:FFFF00:FF0000,temps=33:36:39 --pump mode=4
