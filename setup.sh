#!/bin/sh
set -ue

pwd_dir=$(cd $(dirname $0); pwd)

# mkdir
mkdir ${pwd_dir}/conf
mkdir ${pwd_dir}/log
mkdir ${pwd_dir}/tmp

# replace @BASE_DIR@
sed -i -e "s|@BASE_DIR@|${pwd_dir}|" ${pwd_dir}/shl/template.sh
sed -i -e "s|@BASE_DIR@|${pwd_dir}|" ${pwd_dir}/shl/functions.sh
