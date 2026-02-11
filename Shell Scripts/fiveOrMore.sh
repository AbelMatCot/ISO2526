#!/bin/bash
#Autor: Abel Mateos Cotrina
#Fecha: 10-2-26
#Entregable 3.

function comp_error (){
	if [ $# != 2 ]; then
		echo "Error. El número de parámetros introducidos debe ser 2."
		exit
	fi

	if [ -f $1 ]; then
		echo "Error. El fichero $1 ya existe."
		exit
	fi

	if [ ! -d $2 ]; then
		echo "Error. No existe el directorio $2."
		exit
	fi

	vaciaono=$(ls -A $2)

	if [ -z  "$vaciaono" ]; then
		echo "El directorio $2 está vacío"
		exit
	fi
}

comp_error $1 $2

echo "Autor: Abel Mateos Cotrina"
echo

cuenta=0

for i in $2/*.txt; do

	lineas=$(cat "$i" | wc -l)

	if [ $lineas -ge 5 ]; then
		echo "Nombre: $i"
		echo "$i" >> "$1"
		cuenta=$((cuenta+1))
		echo "El fichero original contiene $lineas lineas." > "$i.q"
		cat "$i" >> "$i.q"
		echo "Creado el fichero $i.q"
		echo
	fi
done

if [ $cuenta -eq 0 ]; then
	echo "No se encontró ningún fichero .txt con 5 o más lineas."
else
	echo $cuenta >> "$1"
fi
