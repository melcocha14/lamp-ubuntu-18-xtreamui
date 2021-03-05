# lamp-ubuntu-18-xtreamui

Instalacion de servidor LAMP mas servidor XtreamUI de ubuntu 18.04 server

Instalar como root usar estos 4 comandos

1.- Comando para hacerte root

sudo su

2.- Comando para descargar el scritp

wget https://raw.githubusercontent.com/melcocha14/lamp-ubuntu-18-xtreamui/master/lamp-ubuntu18.sh

3.- Comando para dar permisos de ejecucion al scritp

chmod 755 lamp-ubuntu18.sh

4.- Comando para correr el scritp

./lamp-ubuntu18.sh



Comando de instalacion para panel de administracion XtreamUi 22F

apt-get install unzip e2fsprogs python-paramiko -y && chattr -i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb && rm -rf /home/xtreamcodes/iptv_xtream_codes/admin && rm -rf /home/xtreamcodes/iptv_xtream_codes/pytools && wget "https://github.com/melcocha14/lamp-ubuntu-18-xtreamui/blob/master/tools/release_22f.zip" -O /tmp/update.zip -o /dev/null && unzip /tmp/update.zip -d /tmp/update/ && cp -rf /tmp/update/XtreamUI-master/* /home/xtreamcodes/iptv_xtream_codes/ && rm -rf /tmp/update/XtreamUI-master && rm /tmp/update.zip && rm -rf /tmp/update && chattr +i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb && chown -R xtreamcodes:xtreamcodes /home/xtreamcodes/ && chmod +x /home/xtreamcodes/iptv_xtream_codes/permissions.sh && /home/xtreamcodes/iptv_xtream_codes/permissions.sh && /home/xtreamcodes/iptv_xtream_codes/start_services.sh
