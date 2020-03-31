#!/bin/bash

echo
while true; do
echo
read -p "¿Quiere realizar la desinstalación?" yn
case $yn in
si ) break;;
no ) exit;;
* ) echo "por favor responda si o no";;
esac
done

echo
echo "si se ejecuta esto es que aceptaste"
echo
echo "Presiona una tecla para continuar...";
read 
echo
echo "Eliminar el directorio"
# Eliminar el repositorio
echo
rm -rf /home/$USER/bin/OpenCorsairLink
echo
echo "Eliminar configuración de inicio"
# Eliminar configuración de inicio
sudo make uninstall
rm /home/$USER/.config/autostart-scripts/OpenCorsairLink.sh
echo " Eliminar acceso directo"
#Eliminar acceso directo
rm /home/$USER/Escritorio/OpenCorsair
echo
echo "Terminado"
