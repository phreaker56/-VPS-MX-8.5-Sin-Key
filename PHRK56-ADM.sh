#!/bin/bash
clear && clear
cd $HOME
RutaBin="/bin"
apt install net-tools -y &>/dev/null
echo "nameserver 1.1.1.1" >/etc/resolv.conf
echo "nameserver 1.0.0.1" >>/etc/resolv.conf
myip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1)
myint=$(ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}')
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime &>/dev/null
rm -rf /usr/local/lib/systemubu1 &>/dev/null
### COLORES Y BARRA
msg() {
  BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
  AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && NEGRITO='\e[1m' && SEMCOR='\e[0m'
  case $1 in
  -ne) cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  "-bar2" | "-bar") cor="${VERMELHO}————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  esac
}
fun_bar() {
  comando="$1"
  _=$(
    $comando >/dev/null 2>&1
  ) &
  >/dev/null
  pid=$!
  while [[ -d /proc/$pid ]]; do
    echo -ne " \033[1;33m["
    for ((i = 0; i < 20; i++)); do
      echo -ne "\033[1;31m##"
      sleep 0.5
    done
    echo -ne "\033[1;33m]"
    sleep 1s
    echo
    tput cuu1
    tput dl1
  done
  echo -e " \033[1;33m[\033[1;31m########################################\033[1;33m] - \033[1;32m100%\033[0m"
  sleep 1s
}
install_paketes() {
  clear && clear
  ### PAQUETES PRINCIPALES
  msg -bar2
  msg -ama "  [ SCRIPT-FREE  \033[1;97m ❌ MOD By @Kalix1 ❌\033[1;33m ]"
  msg -bar
  echo -e "\033[97m"
  echo -e "  \033[41m    -- INSTALACION DE PAQUETES PARA VPS-MX --    \e[49m"
  echo -e "\033[97m"
  msg -bar
  #grep
  apt-get install netcat -y &>/dev/null
  apt-get install netpipes -y &>/dev/null
  apt-get install grep -y &>/dev/null
  apt-get install net-tools -y &>/dev/null
  sudo add-apt-repository universe &>/dev/null
  sudo apt-get install netcat-traditional -y &>/dev/null
  sudo add-apt-repository main -y &>/dev/null
  sudo add-apt-repository universe -y &>/dev/null
  sudo add-apt-repository restricted -y &>/dev/null
  sudo add-apt-repository multiverse -y &>/dev/null
  sudo apt-get install software-properties-common -y &>/dev/null
  sudo add-apt-repository ppa:neurobin/ppa -y &>/dev/null
  sudo apt-get install build-essential -y &>/dev/null
  apt-get install shc &>/dev/null
  [[ $(dpkg --get-selections | grep -w "grep" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "grep" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install grep............ $ESTATUS "
  #gawk
  apt-get install gawk -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "gawk" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "gawk" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install gawk............ $ESTATUS "
  #mlocate
  apt-get install mlocate -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "mlocate" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "mlocate" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install mlocate......... $ESTATUS "
  #lolcat gem
  apt-get install lolcat -y &>/dev/null
  sudo gem install lolcat &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lolcat" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lolcat" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install lolcat.......... $ESTATUS "
  #at
  [[ $(dpkg --get-selections | grep -w "at" | head -1) ]] || apt-get install at -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "at" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "at" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install at.............. $ESTATUS "
  #nano
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] || apt-get install nano -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install nano............ $ESTATUS "
  #bc
  [[ $(dpkg --get-selections | grep -w "bc" | head -1) ]] || apt-get install bc -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "bc" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "bc" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  systemedia &>/dev/null
  echo -e "\033[97m    # apt-get install bc.............. $ESTATUS "
  #lsof
  [[ $(dpkg --get-selections | grep -w "lsof" | head -1) ]] || apt-get install lsof -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lsof" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lsof" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install lsof............ $ESTATUS "
  #figlet
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || apt-get install figlet -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install figlet.......... $ESTATUS "
  #cowsay
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || apt-get install cowsay -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install cowsay.......... $ESTATUS "
  #screen
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || apt-get install screen -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install screen.......... $ESTATUS "
  #python
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] || apt-get install python -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python.......... $ESTATUS "
  #python3
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] || apt-get install python3 -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python3......... $ESTATUS "
  #python3-pip
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] || apt-get install python3-pip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python3-pip..... $ESTATUS "
  #ufw
  [[ $(dpkg --get-selections | grep -w "ufw" | head -1) ]] || apt-get install ufw -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "ufw" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "ufw" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install ufw............. $ESTATUS "
  #unzip
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] || apt-get install unzip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install unzip........... $ESTATUS "
  #zip
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] || apt-get install zip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install zip............. $ESTATUS "
  #apache2
  apt-get install apache2 -y &>/dev/null
  sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf >/dev/null 2>&1
  service apache2 restart >/dev/null 2>&1
  [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install apache2......... $ESTATUS "

}

install_paketes
mkdir /etc/VPS-MX >/dev/null 2>&1

cd /etc/VPS-MX
wget https://www.dropbox.com/s/37e71xhn7x0rz44/VPS-MX.tar.xz >/dev/null 2>&1
tar -xf VPS-MX.tar.xz >/dev/null 2>&1
chmod +x VPS-MX.tar.xz >/dev/null 2>&1
rm -rf VPS-MX.tar.xz
cd
chmod -R 755 /etc/VPS-MX
rm -rf /etc/VPS-MX/MEUIPvps
echo "/etc/VPS-MX/menu" >/usr/bin/menu && chmod +x /usr/bin/menu
echo "/etc/VPS-MX/menu" >/usr/bin/VPSMX && chmod +x /usr/bin/VPSMX
[[ ! -d /usr/local/lib ]] && mkdir /usr/local/lib
[[ ! -d /usr/local/lib/ubuntn ]] && mkdir /usr/local/lib/ubuntn
[[ ! -d /usr/local/lib/ubuntn/apache ]] && mkdir /usr/local/lib/ubuntn/apache
[[ ! -d /usr/local/lib/ubuntn/apache/ver ]] && mkdir /usr/local/lib/ubuntn/apache/ver
[[ ! -d /usr/share ]] && mkdir /usr/share
[[ ! -d /usr/share/mediaptre ]] && mkdir /usr/share/mediaptre
[[ ! -d /usr/share/mediaptre/local ]] && mkdir /usr/share/mediaptre/local
[[ ! -d /usr/share/mediaptre/local/log ]] && mkdir /usr/share/mediaptre/local/log
[[ ! -d /usr/share/mediaptre/local/log/lognull ]] && mkdir /usr/share/mediaptre/local/log/lognull
[[ ! -d /etc/VPS-MX/B-VPS-MXuser ]] && mkdir /etc/VPS-MX/B-VPS-MXuser
[[ ! -d /usr/local/protec ]] && mkdir /usr/local/protec
[[ ! -d /usr/local/protec/rip ]] && mkdir /usr/local/protec/rip
[[ ! -d /etc/protecbin ]] && mkdir /etc/protecbin
rm -rf /etc/VPS-MX/herramientas/speed.sh
rm -rf /etc/VPS-MX/herramientas/speedtest.py
cd /etc/VPS-MX/herramientas
wget https://raw.githubusercontent.com/lacasitamx/VPSMX/master/code/speedtest_v1.tar >/dev/null 2>&1
tar -xf speedtest_v1.tar >/dev/null 2>&1
rm -rf speedtest_v1.tar >/dev/null 2>&1
cd
[[ ! -d /etc/VPS-MX/v2ray ]] && mkdir /etc/VPS-MX/v2ray
[[ ! -d /etc/VPS-MX/Slow ]] && mkdir /etc/VPS-MX/Slow
[[ ! -d /etc/VPS-MX/Slow/install ]] && mkdir /etc/VPS-MX/Slow/install
[[ ! -d /etc/VPS-MX/Slow/Key ]] && mkdir /etc/VPS-MX/Slow/Key
msg -ama "               Finalizando Instalacion" && msg bar2
[[ $(find /etc/VPS-MX/controlador -name nombre.log | grep -w "nombre.log" | head -1) ]] || wget -O /etc/VPS-MX/controlador/nombre.log https://github.com/lacasitamx/VPSMX/raw/master/ArchivosUtilitarios/nombre.log &>/dev/null
[[ $(find /etc/VPS-MX/controlador -name IDT.log | grep -w "IDT.log" | head -1) ]] || wget -O /etc/VPS-MX/controlador/IDT.log https://github.com/lacasitamx/VPSMX/raw/master/ArchivosUtilitarios/IDT.log &>/dev/null
[[ $(find /etc/VPS-MX/controlador -name tiemlim.log | grep -w "tiemlim.log" | head -1) ]] || wget -O /etc/VPS-MX/controlador/tiemlim.log https://github.com/lacasitamx/VPSMX/raw/master/ArchivosUtilitarios/tiemlim.log &>/dev/null
touch /usr/share/lognull &>/dev/null
wget https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SR/SPR -O /usr/bin/SPR &>/dev/null &>/dev/null
chmod 775 /usr/bin/SPR &>/dev/null
wget -O /usr/bin/SOPORTE https://www.dropbox.com/s/dz1onkls1685hc2/soporte &>/dev/null
chmod 775 /usr/bin/SOPORTE &>/dev/null
SOPORTE &>/dev/null
wget -O /bin/rebootnb https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/rebootnb &>/dev/null
chmod +x /bin/rebootnb
wget -O /bin/resetsshdrop https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/resetsshdrop &>/dev/null
chmod +x /bin/resetsshdrop
wget -O /etc/versin_script_new https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Vercion &>/dev/null
grep -v "^PasswordAuthentication" /etc/ssh/sshd_config >/tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >>/etc/ssh/sshd_config
v1=$(curl -sSL "https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Vercion") 
echo "$v1" > /etc/versin_script 
msg -bar2
echo '#!/bin/sh -e' >/etc/rc.local
sudo chmod +x /etc/rc.local
echo "sudo rebootnb" >>/etc/rc.local
echo "sudo resetsshdrop" >>/etc/rc.local
echo "sleep 2s" >>/etc/rc.local
echo "exit 0" >>/etc/rc.local
/bin/cp /etc/skel/.bashrc ~/
echo 'clear' >>.bashrc
echo 'echo ""' >>.bashrc
echo 'echo -e "\t\033[91m __     ______  ____        __  ____  __ " ' >>.bashrc
echo 'echo -e "\t\033[91m \ \   / /  _ \/ ___|      |  \/  \ \/ / " ' >>.bashrc
echo 'echo -e "\t\033[91m  \ \ / /| |_) \___ \ _____| |\/| |\  /  " ' >>.bashrc
echo 'echo -e "\t\033[91m   \ V / |  __/ ___) |_____| |  | |/  \  " ' >>.bashrc
echo 'echo -e "\t\033[91m    \_/  |_|   |____/      |_|  |_/_/\_\ " ' >>.bashrc
echo 'echo "" ' >>.bashrc
echo 'mess1="$(less /etc/VPS-MX/message.txt)" ' >>.bashrc
echo 'echo "" ' >>.bashrc
echo 'echo -e "\t\033[92mRESELLER : $mess1 "' >>.bashrc
echo 'echo -e "\t\e[1;33mVERSION: \e[1;31m$(cat /etc/versin_script_new)"' >>.bashrc
echo 'echo "" ' >>.bashrc
echo 'echo -e "\t\033[97mPARA MOSTAR PANEL BASH ESCRIBA: sudo VPSMX o menu "' >>.bashrc
echo 'echo ""' >>.bashrc
echo -e "         COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
echo -e "  \033[1;41m               sudo VPSMX o menu             \033[0;37m" && msg -bar2
rm -rf /usr/bin/pytransform &>/dev/null
rm -rf VPS-MX.sh
rm -rf lista-arq
service ssh restart &>/dev/null
exit 
} 
ofus () { 
unset server 
server=$(echo ${txt_ofuscatw}|cut -d':' -f1) 
unset txtofus 
number=$(expr length $1) 
for((i=1; i<$number+1; i++)); do 
txt[$i]=$(echo "$1" | cut -b $i) 
case ${txt[$i]} in 
".")txt[$i]="*";; 
"*")txt[$i]=".";; 
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"4")txt[$i]="%";;
"%")txt[$i]="4";;
"-")txt[$i]="K";;
"K")txt[$i]="-";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}
verificar_arq () { 
[[ ! -d ${SCPdir} ]] && mkdir ${SCPdir} 
[[ ! -d ${SCPusr} ]] && mkdir ${SCPusr} 
[[ ! -d ${SCPfrm} ]] && mkdir ${SCPfrm} 
[[ ! -d ${SCPinst} ]] && mkdir ${SCPinst} 
case $1 in 
"menu"|"message.txt"|"menu.enc")ARQ="${SCPdir}/";; #Menu 
"usercodes")ARQ="${SCPusr}/";; #Panel SSRR 
"C-SSR.sh")ARQ="${SCPinst}/";; #Panel SSR 
"openssh.sh")ARQ="${SCPinst}/";; #OpenVPN 
"squid.sh")ARQ="${SCPinst}/";; #Squid 
"dropbear.sh"|"proxy.sh")ARQ="${SCPinst}/";; #Instalacao 
"proxy.sh")ARQ="${SCPinst}/";; #Instalacao 
"openvpn.sh")ARQ="${SCPinst}/";; #Instalacao 
"ssl.sh"|"python.py")ARQ="${SCPinst}/";; #Instalacao 
"shadowsocks.sh")ARQ="${SCPinst}/";; #Instalacao 
"Shadowsocks-libev.sh")ARQ="${SCPinst}/";; #Instalacao 
"Shadowsocks-R.sh")ARQ="${SCPinst}/";; #Instalacao 
"v2ray.sh"|"slowdns.sh")ARQ="${SCPinst}/";; #Instalacao 
"budp.sh")ARQ="${SCPinst}/";; #Instalacao 
"sockspy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py")ARQ="${SCPinst}/";; #Instalacao 
*)ARQ="${SCPfrm}/";; #Herramientas 
esac 
mv -f ${SCPinstal}/$1 ${ARQ}/$1 
chmod +x ${ARQ}/$1 
} 
NOTIFY () { 
clear 
clear 
msg -bar 
msg -ama "     [ PHRK56 - ADM - SCRIPT \033[1;97m MOD \033[1;33m ]" 
msg -bar 
msg -ama " Notify-BOT (Notificasion Remota)|@LaCasitaMx_Noty_Bot " 
msg -bar 
echo -e "\033[1;94m Notify-BOT es un simple notificador de:" 
echo -e "\033[1;94m >> Usuario Expirado" 
echo -e "\033[1;94m >> Usuario Eliminado" 
echo -e "\033[1;94m >> Avisos de VPS Reiniciada" 
echo -e "\033[1;94m >> Avisos de Monitor de Protocolos" 
echo -e "\033[1;97m Inicie El BOT de Telegram" 
echo -e "\033[1;92m ¡¡ Para sacar su ID entre al BOT @conectedmx_bot" 
echo -e "\033[1;92m Aparesera algo parecido 👤 → Tu ID es: 45145564   " 
msg -bar 
echo -e "\033[1;93mIgrese un nombre para el VPS:\033[0;37m"; read -p " " nombr 
echo "${nombr}" > /etc/VPS-MX/controlador/nombre.log 
echo -e "\033[1;93mIgrese su ID 👤:\033[0;37m"; read -p " " idbot 
echo "${idbot}" > /etc/VPS-MX/controlador/IDT.log 
msg -bar 
echo -e "\033[1;32m              ID AGREGADO CON EXITO" 
msg -bar 
wget -qO- ifconfig.me > /etc/VPS-MX/IP.log 
ipt=`less /etc/VPS-MX/IP.log` > /dev/null 2>&1 
Nip="$(echo $ipt)" 
NOM="$(less /etc/VPS-MX/controlador/nombre.log)" 
NOM1="$(echo $NOM)" 
IDB1=`less /etc/VPS-MX/controlador/IDT.log` > /dev/null 2>&1 
IDB2=`echo $IDB1` > /dev/null 2>&1 
KEY="2012880601:AAEJ3Kk18PGDzW57LpTMnVMn_pQYQKW3V9w" 
URL="https://api.telegram.org/bot$KEY/sendMessage" 
MSG="⚠? ►► AVISO DE VPS: $NOM1 ⚠ 
👉 ►► IP: $Nip 
👉 ►► MENSAJE DE PRUEBA 
🔰 ►► NOTI-BOT ACTIVADO CORRECTAMENTE" 
curl -s --max-time 10 -d "chat_id=$IDB2&disable_web_page_preview=1&text=$MSG" $URL &>/dev/null 
echo -e "\033[1;34m            SE ENVIO MENSAJE DE PRUEBA " 
} 
fun_ipe 
wget -O /usr/bin/trans https://raw.githubusercontent.com/phreaker56/VPS-MX-8.5-Sin-Key/main/trans &> /dev/null 
wget -O /bin/Desbloqueo.sh https://raw.githubusercontent.com/phreaker56/VPSMX/master/SCRIPT-8.4/Utilidad/Desbloqueo.sh &> /dev/null 
chmod +x /bin/Desbloqueo.sh 
wget -O /bin/monitor.sh https://raw.githubusercontent.com/phreaker56/VPSMX/master/SCRIPT-8.4/Utilidad/monitor.sh &> /dev/null 
chmod +x /bin/monitor.sh 
wget -O /var/www/html/estilos.css https://raw.githubusercontent.com/phreaker56/VPSMX/master/SCRIPT-8.4/Utilidad/estilos.css &> /dev/null 
[[ -f "/usr/sbin/ufw" ]] && ufw allow 443/tcp ; ufw allow 80/tcp ; ufw allow 3128/tcp ; ufw allow 8799/tcp ; ufw allow 8080/tcp ; ufw allow 81/tcp &>/dev/null 
clear 
msg -bar2 
msg -ama "     [ PHRK56 - ADM - SCRIPT \033[1;97m  MOD  \033[1;33m ]" 
msg -ama "  \033[1;96m      🔰Usar Ubuntu 20 a 64 De Preferencia🔰 " 
msg -bar2 
[[ $1 = "" ]] && funcao_idioma || { 
[[ ${#1} -gt 2 ]] && funcao_idioma || id="$1" 
} 
error_fun () { 
msg -bar2 && msg -verm "ERROR entre VPS<-->GENERADOR (Port 81 TCP)" && msg -bar2 
[[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal} 
exit 1 
} 
invalid_key () { 
msg -bar2 && msg -verm "  Code Invalido -- #¡Key Invalida#! " && msg -bar2 
[[ -e $HOME/lista-arq ]] && rm $HOME/lista-arq 
rm -rf lista-arq 
exit 1 
} 
while [[ ! $Key ]]; do 
msg -bar2 && msg -ne "\033[1;93m          >>> INTRODUSCA LA KEY ABAJO <<<\n   \033[1;37m" && read Key 
tput cuu1 && tput dl1 
done 
msg -ne "    # Verificando Key # : " 
cd $HOME 
wget -O $HOME/lista-arq $(ofus "$Key")/$IP > /dev/null 2>&1 && echo -e "\033[1;32m Code Correcto de KEY" || { 
echo -e "\033[1;91m Code Incorrecto de KEY" 
invalid_key 
exit 
} 
IP=$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') && echo "$IP" > /usr/bin/vendor_code 
sleep 1s 
function_verify 
updatedb 
if [[ -e $HOME/lista-arq ]] && [[ ! $(cat $HOME/lista-arq|grep "Code de KEY Invalido!") ]]; then 
msg -bar2 
msg -verd "    $(source trans -b es:${id} "Ficheros Copiados"|sed -e 's/[^a-z -]//ig'): \e[97m[\e[93mPHRK56-ADM #@ZEROXLAB_bot\e[97m]" 
REQUEST=$(ofus "$Key"|cut -d'/' -f2) 
[[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal} 
pontos="." 
stopping="Configurando Directorios" 
for arqx in $(cat $HOME/lista-arq); do 
msg -verm "${stopping}${pontos}" 
wget --no-check-certificate -O ${SCPinstal}/${arqx} ${IP}:81/${REQUEST}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx}" || error_fun 
tput cuu1 && tput dl1 
pontos+="." 
done 
sleep 1s 
msg -bar2 
listaarqs="$(locate "lista-arq"|head -1)" && [[ -e ${listaarqs} ]] && rm $listaarqs 
cat /etc/bash.bashrc|grep -v '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' > /etc/bash.bashrc.2 
echo -e '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' >> /etc/bash.bashrc.2 
mv -f /etc/bash.bashrc.2 /etc/bash.bashrc 
echo "${SCPdir}/menu" > /usr/bin/menu && chmod +x /usr/bin/menu 
echo "${SCPdir}/menu" > /usr/bin/phrk56 && chmod +x /usr/bin/phrk56 
echo "$Key" > ${SCPdir}/key.txt 
[[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal} 
[[ ${#id} -gt 2 ]] && echo "es" > ${SCPidioma} || echo "${id}" > ${SCPidioma} 
echo -e "${cor[2]}         DESEAS INSTALAR NOTI-BOT?(Default n)" 
echo -e "\033[1;34m  (Deves tener Telegram y el BOT: @LaCasitaMx_Noty_Bot)" 
msg -bar2 
read -p " [ s | n ]: " NOTIFY 
[[ "$NOTIFY" = "s" || "$NOTIFY" = "S" ]] && NOTIFY 
msg -bar2 
[[ ${byinst} = "true" ]] && install_fim 
else 
invalid_key 
rm -rf VPS-MX.sh lista-arq 
fi 
rm -rf VPS-MX.sh lista-arq
