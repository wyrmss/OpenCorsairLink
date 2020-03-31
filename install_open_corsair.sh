#!/bin/bash

echo
echo "Instalando dependencias"...
# Instalar las  dependencias
sudo zypper in libusb-1_0-0 pkgconf-pkg-config git

echo
echo "Descargando el repositorio"
# Descargar el repositorio
echo
git clone https://github.com/audiohacked/OpenCorsairLink.git

# Preguntar si se procede en la instalación
echo
while true; do
echo
read -p "¿Quiere realizar la instalación?" yn
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

# Ejecutar la instalación
mv -i OpenCorsairLink/ /home/$USER/bin/OpenCorsairLink
cp -i ver-tiempo-real.sh /home/$USER/bin/OpenCorsairLink/ver-tiempo-real.sh
cp -i opencorsairlink.png /home/$USER/bin/OpenCorsairLink/opencorsairlink.png
cd /home/$USER/bin/OpenCorsairLink
chmod +x ver-tiempo-real.sh

echo
# Compilación del programa
make
sudo make install

echo "#!/bin/bash

cd /home/$USER/bin/OpenCorsairLink/
sudo ./OpenCorsairLink.elf --device=0 --fan channel=1,mode=6,temps=31:33:36:38,speeds=30:55:65:100
sudo ./OpenCorsairLink.elf --device=0 --fan channel=0,mode=6,temps=31:33:36:38,speeds=30:55:65:100 --led channel=0,mode=5,colors=00FF00:FFFF00:FF0000,temps=33:36:39 --pump mode=4" >> /home/$USER/.config/autostart-scripts/OpenCorsairLink.sh
chmod +x /home/$USER/.config/autostart-scripts/OpenCorsairLink.sh

echo "[Desktop Entry]
Comment[es_ES]=Controlador de la refrigeracion liquida Corsair
Comment=Controlador de la refrigeracion liquida Corsair
Exec=/home/wyrms/bin/OpenCorsairLink/ver-tiempo-real.sh
GenericName[es_ES]=Controlador de la refrigeracion liquida Corsair
GenericName=Controlador de la refrigeracion liquida Corsair
Icon=/home/wyrms/bin/OpenCorsairLink/opencorsairlink.png
MimeType=
Name[es_ES]=OpenCorsairLink1
Name=OpenCorsairLink1
Path=/home/wyrms/bin/OpenCorsairLink
StartupNotify=true
Terminal=true
TerminalOptions=\s--noclose
Type=Application
X-DBUS-ServiceName=
X-DBUS-StartupType=none
X-KDE-SubstituteUID=false
X-KDE-Username=
" >> /home/$USER/Escritorio/OpenCorsair

# Ejecutar ayuda del programa
sudo ./OpenCorsairLink.elf --device=0 --fan channel=1,mode=6,temps=31:33:36:38,speeds=30:55:65:100
sudo ./OpenCorsairLink.elf --device=0 --fan channel=0,mode=6,temps=31:33:36:38,speeds=30:55:65:100 --led channel=0,mode=5,colors=00FF00:FFFF00:FF0000,temps=33:36:39 --pump mode=4
sudo ./OpenCorsairLink.elf --help
