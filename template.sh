#!/bin/bash
##############################
# Script title
#
# Description
##############################
set -ue

SHL_DIR=$(cd $(dirname $0); pwd)
LIB_DIR=${SHL_DIR}/lib
if [ -f "${LIB_DIR}/functions.sh" ]; then
    . ${LIB_DIR}/functions.sh
else
    echo "functions.sh not found." >&2
    exit 1
fi

exec 1> >(tee -a ${LOG})
exec 2> >(tee -a ${LOG_ERR})

##############################
# Script main
##############################
LOGHEADER

LOGFOOTER
exit
