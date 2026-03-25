# Entrega 1 (Pág 53)
# Autor: Abel Mateos
# Fecha: 24-3-2026

import os
import cpuinfo

if os.getuid() != "0":
    print("Error. Este script solo puede ser ejecutado como root.")
    exit()

while True:
    print("========================================")
    print("| 1. Mostrar información de SSOO y CPU |")
    print("| 2. Información/creación de usuario   |")
    print("| 3. Comprobar/crear directorio        |")
    print("|--------------------------------------|")
    print("| 4. Salir                             |")
    print("========================================")
    opcion = input("Elija una opción: ")

    match opcion:

        case "1":
            print("El sistema operativo es:", os.uname().sysname)
            print("El procesador es:", cpuinfo.get_cpu_info()["brand_raw"])

        case "2":
            usuario = input("Introduzca un nombre de usuario: ")
            passwd = open("/etc/passwd", mode="r")
            comp = 0
            for i in passwd.readlines():
                if usuario in i:
                    print("El usuario", usuario, "existe.")
                    print(i)
                    comp = 1
                    break
            if comp == 0:
                os.system("useradd -m " + usuario)
                print("Usuario", usuario, "creado.")
            passwd.close()

        case "3":
            directorio = input("Introduzca el nombre del directorio: ")
            if os.path.isdir(directorio) and os.path.exists:
                print(directorio, "es un directorio ya existente.")
            else:
                os.mkdir(directorio)
                print("El directorio", directorio, "no existe. Ha sido creado.")

        case "4":
            print("Saliendo...")
            exit()
