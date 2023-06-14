#!/bin/bash

#Script HackingHr7

function ctrl_c(){
    echo -e "[!] Saliendo...\n\n"
    exit 1
}

#Ctrl+C

echo -e -n "\nIntroduce el rango de IP a escanear (ejemplo: 192.168.56) -> " && read IP_PREFIX
echo -e "Iniciando escaneo en el rango de IP $IP_PREFIX\n"

# Obtener el último octeto del rango de IP introducido
IP_PREFIX=$(echo $IP_PREFIX | cut -d '.' -f 1-3)

# Realizar el escaneo de disponibilidad de IP
AVAILABLE_IPS=""
for i in $(seq 1 254); do
    ip=$IP_PREFIX.$i
    if ping -c 1 -W 1 $ip >/dev/null; then
        AVAILABLE_IPS+="$ip\n"
    fi
done

if [[ -z $AVAILABLE_IPS ]]; then
    echo "No se encontraron direcciones IP disponibles en el rango especificado."
else
    echo "Direcciones IP disponibles en el rango $IP_PREFIX.0/24:"
    echo -e "$AVAILABLE_IPS"
fi
