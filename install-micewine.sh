#!/data/data/com.termux/files/usr/bin/bash
while :; do
clear
echo -e "[ MiceWine -- Installer ]\n"

echo -e "Escolha uma versão:\n 2) Alpha V2\n 3) Alpha V3\n 4) Alpha V4 -- PatchFix 1\n 5) Alpha V5\n 6) Alpha V5.1\n 7) Alpha V5.2"

read ver

case $ver in "2"|"3"|"4"|"5"|"6"|"7")
	break
	;;
	*)
esac

done

while :; do
case $ver in "4")
	SUFFIX="PatchFix 1"
 	;;
	"6")
 	ver="5.1"
  	;;
   	"7")
    	ver="5.2"
esac

echo -e "Você realmente deseja instalar o MiceWine Alpha V$ver $SUFFIX? (S/N)\n:"
read install

case $install in "S"|"s")
	break
	;;
	"N"|"n")
  	exit 1
	;;
	*)
esac
done

termux-setup-storage

echo "Baixando o MiceWine Alpha V$ver $SUFFIX..."

case $ver in "2")
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.2/MiceWine-Alpha-2.zip
 	;;
  	"3")
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.3/MiceWine-Alpha-V3.zip
 	;;
  	"4")
   	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.4-patchfix1/MiceWine-Alpha-V4-Fix-1.zip
    	;;
    	"5")
    	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5/MiceWine-Alpha-V5.zip
    	;;
    	"5.1")
    	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.1/MiceWine-Alpha-V5.1.zip
     	;;
     	"5.2")
      	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.2/MiceWine-Alpha-V5.2.zip
esac

echo "Extraindo..."
case $ver in "2")
	unzip -o MiceWine-Alpha-2.zip -d /data/data/com.termux/files/
 	;;
  	"3")
	unzip -o MiceWine-Alpha-V3.zip -d /data/data/com.termux/files/
 	;;
  	"4")
   	unzip -o MiceWine-Alpha-V4-Fix-1.zip -d /data/data/com.termux/files/
    	;;
 	"5")
  	unzip -o MiceWine-Alpha-V5.zip -d /data/data/com.termux/files/
   	;;
    	"5.1")
    	unzip -o MiceWine-Alpha-V5.1.zip -d /data/data/com.termux/files/
     	;;
    	"5.2")
    	unzip -o MiceWine-Alpha-V5.2.zip -d /data/data/com.termux/files/
esac

rm -rf MiceWine-Alpha-2.zip MiceWine-Alpha-V3.zip MiceWine-Alpha-V4-Fix-1.zip MiceWine-Alpha-V5.zip MiceWine-Alpha-V5.1.zip MiceWine-Alpha-V5.2.zip 

while :; do
echo -e "Deseja instalar a interface XFCE? (S/N) (Opcional)\n"
read xfce

case $xfce in "S"|"s")
	pkg ins xfce4 firefox -y
 	break
  	;;
   	"N"|"n")
    	break
esac
done

echo -e "MiceWine Alpha V$ver $SUFFIX - Instalado!\n"
echo -e "Digite "exit", abra o Termux e em seguida\nDigite: "micewine" para começar usar!"

exit
