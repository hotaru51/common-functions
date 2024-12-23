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

echo "LANG=${LANG}"
echo "PATH=${PATH}"
echo "SHL_DIR=${SHL_DIR}"
echo "CONF_DIR=${CONF_DIR}"
echo "LOG_DIR=${LOG_DIR}"
echo "TMP_DIR=${TMP_DIR}"
echo "SHL_FILE=${SHL_FILE}"
echo "SHL_NAME=${SHL_NAME}"
echo "TMP=${TMP}"
echo "LOG=${LOG}"
echo "LOG_ERR=${LOG_ERR}"

echo 'stdout'
echo 'stderr' >&2

INFO_MSG "sample message."
ERR_MSG "sample error message."

if [ "$#" -ge 1 ] && [ "$1" == "error" ]; then
    false
fi

LOGFOOTER
exit
