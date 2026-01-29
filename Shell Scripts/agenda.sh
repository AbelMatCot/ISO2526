#!/bin/bash

#Autor: Abel Mateos Cotrina
#Fecha: 29-1-2026

while true; do
	echo
        echo "|==============================|"
        echo "|      · Menú de agenda ·      |"
        echo "|==============================|"
        echo "|a) Añadir una entrada         |"
        echo "|b) Buscar por DNI             |"
        echo "|c) Ver agenda completa        |"
        echo "|d) Eliminar todas las entradas|"
        echo "|------------------------------|"
        echo "|e) Salir                      |"
        echo "|==============================|"

        read -p "Elija opción: " opt
	dnicheck=$(grep "^$dni" agenda.txt | cut -f 1 -d ":" )

case $opt in

	a)
		echo "- Añadir una entrada -"
		read -p "Introduzca el DNI: " dni


			if [ "$dni:" != "$dnicheck" ]; then
				read -p "Introduzca el nombre: " nombre
				read -p "Introduzca los apellidos: " apellidos
				read -p "Introduzca la localidad: " localidad
				echo $dni:$nombre:$apellidos:$localidad >> agenda.txt
				echo "Entrada añadida con éxito."
			else
				echo "El DNI introducido ya existe."
			fi
	;;
	b)
		echo "- Buscar por DNI - "
		read -p "Introduzca el DNI: " dni

		bnombre=$(grep "^$dni:" agenda.txt | cut -f 2 -d ":")
		bapellidos=$(grep "^$dni:" agenda.txt | cut -f 3 -d ":")
		blocalidad=$(grep "^$dni:" agenda.txt | cut -f 4 -d ":")

		if [ "$dni" != "$dnicheck" ]; then
			echo "La persona con DNI número $dni es: $bnombre $bapellidos, y vive en $blocalidad."
		else
			echo "El DNI introducido no existe."
		fi
	;;
	c)
		echo "- Ver agenda completa -"
		if [ ! -s agenda.txt ]; then
			echo "La agenda está vacía."
		else
			cat agenda.txt
		fi
	;;
	d)
		echo "- Eliminar todas las entradas -"
		read -p "¿Seguro que quiere borrar la agenda completa? y/n " conf
		case $conf in
		y)
			> agenda.txt
			echo "Agenda borrada con éxito."
		;;
		*)
			echo "Operación cancelada."
		;;
		esac
	;;
	e)
		echo "- Salir -"
		exit
	;;
	*)
		echo "Opción no válida."
esac

done
