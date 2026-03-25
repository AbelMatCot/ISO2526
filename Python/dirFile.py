# Entrega 2 (Pág 55)
# Autor: Abel Mateos Cotrina
# Fecha: 25-3-2026

import os
import shutil as s

rutas = open("rutas.txt")

directorios = []
ficheros = []

for i in rutas:
    ruta = i.strip()
    if os.path.isdir(ruta):
        directorios.append(ruta)
    elif os.path.isfile(ruta):
        ficheros.append(ruta)

rutas.close()

while True:
    print("=================================")
    print("| A. Eliminar fichero           |")
    print("| B. Información de directorio  |")
    print("| C. Copiar fichero             |")
    print("| D. Mostrar lista de rutas     |")
    print("|-------------------------------|")
    print("| E. Salir                      |")
    print("=================================")
    opcion = input("Elija una opción: ")

    comp = 0
    match opcion:

        case "A":
            fich = input("Introduce el nombre del fichero que eliminar: ")
            for f in ficheros:
                if fich in f and os.path.isfile(f):
                    os.remove(f)
                    ficheros.remove(f)
                    print("Fichero", fich, "eliminado.")
                    comp = 1
                    break

            if comp == 0:
                print("Error. Fichero no encontrado.")

        case "B":
            dire = input("Introduce el nombre del directorio: ")
            for d in directorios:
                if dire in d and os.path.isdir(d):
                    os.system("ls -la " + d)
                    comp = 1
            if comp == 0:
                print("Error. Directorio no encontrado.")

        case "C":
            origen = input("Introduce el fichero que copiar: ")
            destino = input("Introduce la ruta de destino: ")
            for f in ficheros:
                if origen in f and os.path.isfile(f) and os.path.isdir(destino):
                    s.copy(f, destino)
                    print("Fichero", origen, "copiado en",destino)
                    comp = 1
                    ficheros.append(os.path.join(destino, origen))
                    break
            if comp == 0:
                print("Error. Fichero o ruta de destino no encontrados.")

        case "D":
            mostrar = input("¿Qué lista quieres ver, directorios o ficheros? D / F ")
            if mostrar == "D":
                print(directorios)
            elif mostrar == "F":
                print(ficheros)
            else:
                print("Opción no válida")

        case "E":
            print("Saliendo...")
            exit()

        case _:
            print("Opción no válida")
