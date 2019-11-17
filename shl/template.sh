#!/bin/sh
##############################
# Script title
#
# Description
##############################
FUNCTIONS=@BASE_DIR@/shl/functions.sh
if [ -f ${FUNCTIONS} ]; then
    . ${FUNCTIONS}
else
    echo "functions.sh not found."
    exit 1
fi

##############################
# Script main
##############################
LOGHEADER

LOGFOOTER
exit
