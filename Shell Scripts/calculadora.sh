#!/bin/bash

#Autor: Abel Mateos Cotrina
#Fecha: 4-2-26
#Comentario: Entregable 2. Calculadora.sh

echo "Autor: Abel Mateos Cotrina"
echo

if [ $# -ne 2 ]; then
	echo "Error. Solo pueden introducirse dos parámetros."
	exit
fi

if [ -f $1 ]; then
	echo "Error. El fichero \"$1\" ya existe. Introduzca el nombre de un fichero nuevo."
	exit
fi

if [ $2 -eq 0 ]; then
	echo "Error. La cantidad de operaciones a realizar no puede ser 0."
	exit
fi

echo "Se creará el fichero \"$1\" para guardar el historial de operaciones"

for ((i=1;i<=$2;i++)); do
	echo
	echo "------------- Cálculo número $i de los $2 ----------------"
	echo "Introduce la letra de la operación a realizar:"
	echo "S suma | R resta | M multiplicación | D división | X salir"
	echo
	echo "Seguida de los operandos en el siguiente formato:"
	read -p "Operación Op1 Op2: " Operacion Op1 Op2
	echo "----------------------------------------------------------"
	case $Operacion in
		"S")
			res=$((Op1+Op2))
			echo "$Op1 + $Op2 = $res"
			echo "$Operacion Op1 Op2" >> $1
		;;
		"R")
			res=$((Op1-Op2))
			echo "$Op1 - $Op2 = $res"
			echo "$Operacion Op1 Op2" >> $1
		;;
		"M")
			res=$((Op1*Op2))
			echo "$Op1 x $Op2 = $res"
			echo "$Operacion Op1 Op2" >> $1
		;;
		"D")
			res=$((Op1/Op2))
			echo "$Op1 : $Op2 = $res"
			echo "$Operacion Op1 Op2" >> $1
		;;
		"X")
			echo "Saliendo..."
			exit
		;;
		*)
			echo "La operación introducida no es una opción válida."
		;;
	esac
done

echo "Último cálculo realizado. Saliendo..."
