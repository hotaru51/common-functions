#!/bin/sh
##############################
# functions.sh
#
# Common functions
##############################
export LANG=C
BASE_DIR=@BASE_DIR@

CONF_DIR=${BASE_DIR}/conf
LOG_DIR=${BASE_DIR}/log
TMP_DIR=${BASE_DIR}/tmp
SHL_DIR=$(cd $(dirname ${0}); pwd)

SHL_NAME=`basename $0`
TMP=${TMP_DIR}/${SHL_NAME}_`date '+%Y%m%d'`_$$.tmp
LOG=${LOG_DIR}/${SHL_NAME}_`date '+%Y%m%d'`.log

##############################
# LOGHEADER, LOGFOOTER
##############################
LOGHEADER() {
echo "========== `date '+%Y/%m/%d(%a) %H:%M:%S'` ${SHL_NAME} start. ==========" | tee -a ${LOG}
}

LOGFOOTER() {
echo "========== `date '+%Y/%m/%d(%a) %H:%M:%S'` ${SHL_NAME} end. ==========" | tee -a ${LOG}
}

##############################
# INFO_MSG, ERR_MSG, ABORT
##############################
INFO_MSG() {
echo "[info] `date '+%Y/%m/%d(%a) %H:%M:%S'` ${1}" | tee -a ${LOG}
}

ERR_MSG() {
echo "[error] `date '+%Y/%m/%d(%a) %H:%M:%S'` ${1}" | tee -a ${LOG}
}

ABORT() {
LOGFOOTER
exit 1
}
