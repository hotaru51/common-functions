##############################
# functions.sh
#
# Common functions
##############################
export LANG=C

CONF_DIR=${SHL_DIR}/conf
LOG_DIR=${SHL_DIR}/log
TMP_DIR=${SHL_DIR}/tmp

SHL_FILE=`basename $0`
SHL_NAME=`basename $0 | sed -e 's/\..\+$//'`
TMP=${TMP_DIR}/${SHL_NAME}_`date '+%Y%m%d'`_$$.tmp
LOG=${LOG_DIR}/${SHL_NAME}_`date '+%Y%m%d'`.log

##############################
# LOGHEADER, LOGFOOTER
##############################
LOGHEADER() {
echo "========== `date '+%Y/%m/%d(%a) %H:%M:%S'` ${SHL_FILE} start. ==========" | tee -a ${LOG}
}

LOGFOOTER() {
echo "========== `date '+%Y/%m/%d(%a) %H:%M:%S'` ${SHL_FILE} end.   ==========" | tee -a ${LOG}
}

##############################
# INFO_MSG, ERR_MSG, ABORT
##############################
INFO_MSG() {
echo "`date '+%Y/%m/%d(%a) %H:%M:%S'` `printf '%+7s' '[info]'` ${1}" | tee -a ${LOG}
}

ERR_MSG() {
echo "`date '+%Y/%m/%d(%a) %H:%M:%S'` `printf '%+7s' '[error]'` ${1}" | tee -a ${LOG}
}

ABORT() {
LOGFOOTER
exit 1
}
