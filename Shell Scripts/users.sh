#!/bin/bash
#Autor: Abel Mateos Cotrina
#Fecha: 12-2-26

if [ $# -lt 1 ]; then
	par=1000
else
	par=$1
fi

lineas=$(cat /etc/passwd)
contador=0

echo "======================================================="
echo
date +"Informe de usuarios del día %d-%m-%Y a las %H:%M"
echo
for l in $lineas; do

uidt=$(echo $l | cut -f 3 -d ":")
usert=$(echo $l | cut -f 1 -d ":")

	if [ $uidt -ge $par 2>/dev/null ]; then
		contador=$((contador+1))
		echo "$usert – $uidt"
		echo
	fi
done
echo "Total: $contador usuarios"
echo
echo "======================================================="

date +"%d-%m-%Y – %H:%M – El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos
