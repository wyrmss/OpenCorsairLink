#!/bin/bash


clear
while :
do
echo " Escoja una opcion "
echo "1. Instalar dependencias?"
echo "2. Instalar"
echo "3. Crear acceso directo?"
echo "4. Desinstalar"
echo "5. Salir"
echo -n "Seleccione una opcion [1 - 5]"
read opcion
case $opcion in
1) echo "Instalando...:";
echo
echo "Instalando dependencias"...
# Instalar las  dependencias
sudo zypper in libusb-1_0-0 pkgconf-pkg-config git
;;
2) echo "Instalando...";
echo
echo "Descargando el repositorio"
# Descargar el repositorio
echo
git clone https://github.com/audiohacked/OpenCorsairLink.git
echo

# Ejecutar la instalación
mv -i OpenCorsairLink/ /home/$USER/bin/OpenCorsairLink
mv -i ver-tiempo-real.sh /home/$USER/bin/OpenCorsairLink/ver-tiempo-real.sh
mv -i opencorsairlink.png /home/$USER/bin/OpenCorsairLink/opencorsairlink.png
mv -i OpenCorsairLink.sh /home/$USER/bin/OpenCorsairLink/OpenCorsairLink.sh
ln -s /home/$USER/bin/OpenCorsairLink/OpenCorsairLink.sh /home/$USER/.config/autostart-scripts/OpenCorsairLink.sh
chmod +x ver-tiempo-real.sh
chmod +x OpenCorsairLink.sh
echo
# Ejecutar ayuda del programa
sudo ./OpenCorsairLink.elf --device=0 --fan channel=1,mode=6,temps=31:33:36:38,speeds=30:55:65:100
sudo ./OpenCorsairLink.elf --device=0 --fan channel=0,mode=6,temps=31:33:36:38,speeds=30:55:65:100 --led channel=0,mode=5,colors=00FF00:FFFF00:FF0000,temps=33:36:39 --pump mode=4
sudo ./OpenCorsairLink.elf --help
echo
# Compilación del programa
cd /home/wyrms/bin/OpenCorsairLink/
make
sudo make install

echo
echo "Instalacióm terminada"
echo
;;
3) cp -i OpenCorsairLink.desktop /home/$USER/Escritorio/OpenCorsairLink.desktop
echo
echo "Acceso directo creado"
echo
;;
4) echo "Desinstalando..."
cd /home/$USER/bin/OpenCorsairLink
sudo make uninstall
rm -vrf /home/$USER/.config/autostart-scripts/OpenCorsairLink.sh
rm -vrf /home/$USER/Escritorio/OpenCorsair
rm -vrf /home/$USER/bin/OpenCorsairLink/ver-tiempo-real.sh
rm -vrf /home/$USER/bin/OpenCorsairLink/
echo
echo "Desinstalación terminada"
exit 1
;;
5) echo "chao";
exit 1;;
*) echo "$opc es una opcion invalida. Es tan dificil?";
echo "Presiona una tecla para continuar...";
read foo;;
esac
done

