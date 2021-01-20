#!/bin/bash
echo " "
jeshile='\e[40;38;5;82m'
jo='\e[0m'
os=$(exec uname -m|grep 64)
if [ "$os" = "" ]
then os="x86"
else os="x64"
fi

DIRE=$(hostname -I)
DIREMODE=$(expr "$DIRE" : '\(.*\).')


echo -e "${jeshile} +-----------------------------+ \e[0m"
echo -e "${jeshile} ¦Revisando Version del sistema¦ \e[0m"
echo -e "${jeshile} +-----------------------------+ \e[0m"
sleep 3

echo -e "${jeshile} +------------------------------+ \e[0m"
echo -e "${jeshile} ¦Sistema de $os Bits Detecatado¦ \e[0m"
echo -e "${jeshile} +------------------------------+ \e[0m"
sleep 3

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦       Prerequisitos       ¦ \e[0m"
echo -e "${jeshile} ¦                           ¦ \e[0m"
echo -e "${jeshile} ¦ Contraseña de PhpMyadmin  ¦ \e[0m"
echo -e "${jeshile} ¦ Contraseña de MySql       ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 5

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Escribe la contraseña    ¦ \e[0m"
echo -e "${jeshile} ¦     de PhpMyadmin         ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

read CONTRAPHP
echo "Tu Contraseña de PhpMyadmin es: $CONTRAPHP"

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Escribe la contraseña    ¦ \e[0m"
echo -e "${jeshile} ¦        de MYSQL           ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3

read CONTRAMYSQL
echo "Tu Contraseña de PhpMyadmin es: $CONTRAMYSQL"


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Actulizando el sisteama  ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt update -y

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦    Instalando Apache2     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt install apache2 -y

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Instalando MYSQL Server  ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt install mysql-server -y


echo " "
echo -e "${jeshile} +-------------------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦    Configurando seguridad MYSQL                       ¦ \e[0m"
echo -e "${jeshile} ¦    Tu contraseña de Mysql es $CONTRAMYSQL             ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} ¦    *****  La primera opciones le dices N  *****       ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} ¦   Te pediera el password de mysql                     ¦ \e[0m"
echo -e "${jeshile} ¦   lo escribes 2 veces                                 ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} ¦VALIDATE PASSWORD PLUGIN                   presiona n  ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} ¦  *****  Las siguientes 4 opciones le dices Y  *****   ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} ¦Remove anonymous users?                    presiona y  ¦ \e[0m"
echo -e "${jeshile} ¦Disallow root login remotely?              presiona y  ¦ \e[0m"
echo -e "${jeshile} ¦Remove test database and access to it?     presiona y  ¦ \e[0m"
echo -e "${jeshile} ¦Reload privilege tables now?               presiona y  ¦ \e[0m"
echo -e "${jeshile} ¦                                                       ¦ \e[0m"  
echo -e "${jeshile} ¦                                                       ¦ \e[0m"
echo -e "${jeshile} +-------------------------------------------------------+ \e[0m"
sleep 3
sudo mysql_secure_installation



echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Instalando PHP 7.2       ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt install php libapache2-mod-php php-mysql -y

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦  Agreando PHP al Inicio   ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo sed -i 's/DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm/DirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htm/g' /etc/apache2/mods-enabled/dir.conf

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦    Reiniciando Apache     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo systemctl restart apache2


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦ Actualizando Repositorios ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt update

echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦   Instalando PhpMyadmin   ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt install phpmyadmin php-mbstring php-gettext -y
sudo phpenmod mbstring
sudo systemctl restart apache2


echo " "
echo -e "${jeshile} +---------------------------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦                                                               ¦ \e[0m"
echo -e "${jeshile} ¦               Configurando Usuario de MYSQL                   ¦ \e[0m"
echo -e "${jeshile} ¦                                                               ¦ \e[0m"
echo -e "${jeshile} +---------------------------------------------------------------+ \e[0m"
sleep 3
mysql --user=root --password=$CONTRAMYSQL -e "CREATE USER admin@localhost IDENTIFIED BY '$CONTRAPHP';"
mysql --user=root --password=$CONTRAMYSQL -e "GRANT ALL PRIVILEGES ON *.* TO admin@localhost WITH GRANT OPTION;"
mysql --user=root --password=$CONTRAMYSQL -e "FLUSH PRIVILEGES;"


echo -e "${jeshile} +------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦   Resolviendo error 613 de  PhpMyadmin   ¦ \e[0m"
echo -e "${jeshile} +------------------------------------------+ \e[0m"
sleep 3
sudo sed -i 's/] == 1)/]) == 1)/g' /usr/share/phpmyadmin/libraries/sql.lib.php
sudo sed -i 's/'"'"')))/'"'"'))/g' /usr/share/phpmyadmin/libraries/sql.lib.php


echo -e "${jeshile} +------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦   Resolviendo error 532 de  PhpMyadmin   ¦ \e[0m"
echo -e "${jeshile} +------------------------------------------+ \e[0m"
sleep 3
sudo sed -i 's/count($options)/count((array)$options)/g' /usr/share/phpmyadmin/libraries/plugin_interface.lib.php


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦    Reiniciando Apache     ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo service apache2 restart


echo -e "${jeshile} +---------------------------+ \e[0m"
echo -e "${jeshile} ¦   Instalando Python       ¦ \e[0m"
echo -e "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt-get install python -y
sudo apt-get install python-paramiko -y

sudo wget https://raw.githubusercontent.com/melcocha14/lamp-ubuntu-18-xtreamui/master/tools/install.py


echo " "
echo -e "${jeshile} +-----------------------------------------------------------+ \e[0m"
echo -e "${jeshile} ¦      Creditos y soporte melcocha14@gmail.com             ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Tus Datos de Acceso son:                            ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Datos acceso de PhpMyadmin                          ¦ \e[0m"
echo -e "${jeshile} ¦      Usuario: 	admin                                  ¦ \e[0m"
echo -e "${jeshile} ¦      Contraseña: 	$CONTRAPHP                             ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Link de acceso Phpmyadmin                           ¦ \e[0m"
echo -e "${jeshile} ¦      http://$DIREMODE/phpmyadmin                         ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Datos de acceso Mysql                               ¦ \e[0m"
echo -e "${jeshile} ¦      Usuario: 	root                                   ¦ \e[0m"
echo -e "${jeshile} ¦      Contraseña: 	$CONTRAMYSQL                           ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Guarda tus Datos en un lugar seguro                 ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} ¦      Escribe el siguiente comando y escribe MAIN         ¦ \e[0m"
echo -e "${jeshile} ¦      python install.py                                   ¦ \e[0m"
echo -e "${jeshile} ¦                                                          ¦ \e[0m"
echo -e "${jeshile} +-----------------------------------------------------------+ \e[0m"
echo " "
sleep 3

