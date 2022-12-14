#!/bin/bash
source "./scripts/print_colores.sh"
ruta_modulos=$1
# ruta_libreria="../../catch.hpp"
echo "ruta_modulos: $ruta_modulos" #verifico que me llego la ruta de modulos # VOLVER A COMMENT
cd $ruta_modulos
# pwd # verifico que estoy en la ruta de modulos # VOLVER A COMMENT
lista_modulos_unitarios=$(ls -x)
# printf_g $lista_modulos_unitarios     # si o si. si los espacios son de mas de 1 dentro del nombre de archivo ya falla el programa
# si solo hay un espacio en el nombre de algun archivo aun funciona el programa
lista_modulos_unitarios=${lista_modulos_unitarios//"  "/"___"} # reconoce limite de cada elemento 
lista_modulos_unitarios=${lista_modulos_unitarios//" "/"XXX"} # reemplazo espacio dentro del nombre de cada elemento
lista_modulos_unitarios=${lista_modulos_unitarios//"___"/" "} # devuelvo el separador de elemntos como espacio
# printf_y $lista_modulos_unitarios     # revisar si estan separados por 1 espacio y losnombre nos tienen espacio # VOLVER A COMMENT
for i in $lista_modulos_unitarios
do
    ruta_fix=${i//"XXX"/ }
    printf_b $ruta_fix                  # VOLVER A COMMENT
    if [[ -d "$ruta_fix" ]]; then
        # printf_g si es archivo        # VOLVER A COMMENT
        # pwd                   # donde estoy al principio      # VOLVER A COMMENT
        cd "./$ruta_fix"
        # pwd                   # donde estoy al entrar         # VOLVER A COMMENT
        lista=$(ls | grep .cpp)
        printf_y $lista
        if [[ $lista != "" ]] ; then
            # printf_g tiene algo sino no seria distinto de nada porque busque algo con .cpp    # VOLVER A COMMENT
            g++ -o0 -g3 -Wall -c -o "./${lista//".cpp"/".o"}" "./$lista"
            g++ -o ./catch.exe "./${lista//".cpp"/".o"}"
            algo=$(./catch.exe)
            if [ $? -eq 0 ]; then
                printf_g todos los test pasaron. voy a auto implementarlos
                # cp -r 
                printf_v esto quiero copiar alla $ruta_fix
                existe "../../../src/modules/$ruta_fix"
                if [[ $? -eq 1 ]]; then
                    printf_r ya existe no voy a crearlo
                else
                    printf_r procedo a crearlo
                    mkdir "../../../src/modules/$ruta_fix"
                fi
                lista=$(ls | grep .hpp) # the cpp solo lo use para probarlo. however the module that i go to implement is the file with extend .hpp
                cp  "./$lista" "../../../src/modules/$ruta_fix/" # so i go to proced to copy the file of .hpp to modules of sources
            else
                printf_r enviar por correo los fallos al desarrollador
            fi
        fi

        cd ..                   # regreso
    fi
echo lista_modulos_unitarios: $lista_modulos_unitarios
done

