# https://www.golinuxcloud.com/how-to-pass-multiple-parameters-in-shell-script-in-linux/

#!/bin/bash
##
# @Description: Steps to pass multiple parameters in shell script
# Take single argument
##

function show_usage (){
    printf "Usage: $0 [options [parameters]]\n"
    printf "\n"
    printf "Options:\n"
    printf " -n|--number, Print number\n"
    printf " -s|--single [rpm_name], Print rpm version\n"
    printf " -m|--mdstat, Print /proc/mdstst (Update)\n"
    printf " -c|--collect, Collect rpm list to log file\n"
    printf " -t|--timeout, Collect timeout\n"
    printf " -p|--path, Provide the path\n"
    printf " -h|--help, Print help\n"

return 0
}

if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]];then
    show_usage
else
    echo "Incorrect input provided"
    show_usage
fi
