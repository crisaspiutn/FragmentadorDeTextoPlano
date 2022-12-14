#!/bin/bash
function printf_r(){
    printf '\033[1;31m'"$*"'\033[0m'"\n" 
}
function printf_g(){
    printf '\033[0;32m'"$*"'\033[0m'"\n"
}
function printf_y(){
    printf '\033[1;33m'"$*"'\033[0m'"\n"
}
function printf_b(){
    printf '\033[1;34m'"$*"'\033[0m'"\n"
}
function printf_v(){
    printf '\033[1;35m'"$*"'\033[0m'"\n"
}

function existe(){
    local lista_modulos_unitarios=$*
    printf_y $*
    # lista_modulos_unitarios=${lista_modulos_unitarios//"  "/"___"} # reconoce limite de cada elemento 
    lista_modulos_unitarios=${lista_modulos_unitarios//" "/"ZZZ"} # reemplazo espacio dentro del nombre de cada elemento
    # lista_modulos_unitarios=${lista_modulos_unitarios//"___"/" "} # devuelvo el separador de elemntos como espacio   
    echo lista_modulos_unitarios: $lista_modulos_unitarios
    for i in ${lista_modulos_unitarios}; do
        local ruta_fix=${i//"ZZZ"/ }
        if [[ -d $ruta_fix ]]; then
            return 1
        elif [[ -f $ruta_fix ]]; then
            return 1
        else
            return 0
        fi
    done
}