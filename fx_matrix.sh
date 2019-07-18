#!/bin/bash

echo -e "\033[2J\033[?25l"; R=`tput lines` C=`tput cols`;: $[R--] ; while true 
do ( e=echo\ -e s=sleep j=$[RANDOM%C] d=$[RANDOM%R];for i in `eval $e {1..$R}`;
do c=`printf '\\\\0%o' $[RANDOM%57+33]` ### http://bruxy.regnet.cz/web/linux ###
$e "\033[$[i-1];${j}H\033[32m$c\033[$i;${j}H\033[37m"$c; $s 0.1;if [ $i -ge $d ]
then $e "\033[$[i-d];${j}H ";fi;done;for i in `eval $e {$[i-d]..$R}`; #[mat!rix]
do echo -e "\033[$i;${j}f ";$s 0.1;done)& sleep 0.05;done #(c) 2011 -- [ BruXy ]

# wget -O - -q 'https://gist.githubusercontent.com/makramjandar/2f63fdd588d93307f528413ba25a65c4/raw/ff2722a5c7283ec1fba557d1cde555b7508bad6f/add_to_bash_xtra.sh' | bash
