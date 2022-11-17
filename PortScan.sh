#!/bin/bash

#Script HackingHr7

function ctrl_c(){
	echo -e "[!] Saliendo...\n\n"
	exit 1
}

#Ctrl+C

echo -e -n "\nIntroduce la Direcion IP a escanear -> " && read IP
echo -e "Iniciando escaneo en la IP $IP\n"
for port in $(seq 1 65535); do (echo '' > /dev/tcp/$IP/$port) 2>/dev/null && echo "[+] $port - OPEN" &done; wait

