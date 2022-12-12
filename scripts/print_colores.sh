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