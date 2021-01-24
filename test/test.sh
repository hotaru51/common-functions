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

##############################
# Script main
##############################
LOGHEADER

echo "LANG=${LANG}" 2>&1 | tee -a ${LOG}
echo "PATH=${PATH}" 2>&1 | tee -a ${LOG}
echo "SHL_DIR=${SHL_DIR}" 2>&1 | tee -a ${LOG}
echo "CONF_DIR=${CONF_DIR}" 2>&1 | tee -a ${LOG}
echo "LOG_DIR=${LOG_DIR}" 2>&1 | tee -a ${LOG}
echo "TMP_DIR=${TMP_DIR}" 2>&1 | tee -a ${LOG}
echo "SHL_FILE=${SHL_FILE}" 2>&1 | tee -a ${LOG}
echo "SHL_NAME=${SHL_NAME}" 2>&1 | tee -a ${LOG}
echo "TMP=${TMP}" 2>&1 | tee -a ${LOG}
echo "LOG=${LOG}" 2>&1 | tee -a ${LOG}

INFO_MSG "sample message."
ERR_MSG "sample error message."

if [ "$#" -ge 1 ] && [ "$1" == "error" ]; then
    false
fi

LOGFOOTER
exit
