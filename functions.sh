##############################
# functions.sh
#
# Common functions
##############################
export LANG=C.UTF-8
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

SHL_DIR=$(cd $(dirname $0); pwd)
CONF_DIR=${SHL_DIR}/conf
LOG_DIR=${SHL_DIR}/log
TMP_DIR=${SHL_DIR}/tmp

SHL_FILE=`basename $0`
SHL_NAME=`basename $0 | sed -e 's/\..\+$//'`
TMP=${TMP_DIR}/${SHL_NAME}_`date '+%Y%m%d'`_$$.tmp
LOG=${LOG_DIR}/${SHL_NAME}.log

##############################
# INFO_MSG, ERR_MSG, ABORT
##############################
function INFO_MSG() {
    echo "`date '+%Y-%m-%d(%a) %H:%M:%S'` `printf '%-7s' '[info]'` ${1}" | tee -a ${LOG}
}

function ERR_MSG() {
    echo "`date '+%Y-%m-%d(%a) %H:%M:%S'` `printf '%-7s' '[error]'` ${1}" | tee -a ${LOG}
}

function ABORT() {
    LOGFOOTER
    exit 1
}

##############################
# LOGHEADER, LOGFOOTER
##############################
function LOGHEADER() {
    INFO_MSG "START ${SHL_FILE}"
}

function LOGFOOTER() {
    INFO_MSG "END ${SHL_FILE}"
}

##############################
# TRAP
##############################
function ON_ERROR() {
    local status=$?
    local file=$0
    local line=$1
    shift

    args=''
    for s in "$@"
    do
        args="${args}\"${s}\" "
    done

    ERR_MSG "error occured on ${file} LINE: ${line} STATUS: ${status}"
    ERR_MSG "args: ${file} ${args}"
    LOGFOOTER
}

trap 'ON_ERROR $LINENO "$@"' ERR
