#!/bin/bash
# Script to construct a build condition based on a command's return code
# bld meta_prop status_cross_native $TAG returns '1' instead of 0 if command is successful
# Based on this command exit code we will trigger the cross native build

TAG=$1
cross_native_status=`bld meta_prop status_cross_native $TAG 2>&1`
ret=`echo $?`

if [ $ret -eq 1 ]; then
    if [ $cross_native_status = 'success' ]; then
        echo 'CROSS_NATIVE_FOUND'
    else
        echo 'CROSS_NATIVE_NOT_FOUND'
    fi
else
    echo 'CROSS_NATIVE_NOT_FOUND'
fi
