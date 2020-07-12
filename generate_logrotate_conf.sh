#!/bin/sh

set -ue

if [ "`id -u`" -ne 0 ]; then
    echo "please run as root user"
    exit 1
fi

shl_dir="$(cd $(dirname $0); pwd)"
base_dir="$(cd $(dirname ${shl_dir}); pwd)"
cron_dir='/etc/logrotate.d'
conf_file="`basename ${base_dir}`_log"
conf_path="${cron_dir}/${conf_file}"

if [ -d "{cron_dir}" ]; then
    echo "${cron_dir} not found"
    exit 1
fi

if [ -f "${conf_path}" ]; then
    mv ${conf_path} /tmp/`basename ${conf_path}`.$$.bak
    cat /dev/null > ${conf_path}
fi

find ${base_dir} -maxdepth 1 -type f -name '*.sh' | while read line
do
    log_dir="${base_dir}/log"
    log_file="$(echo `basename ${line}` | sed -e 's/\.sh$/.log/')"
    echo "\"${log_dir}/${log_file}\""
done | head -c -1 > ${conf_path}

cat <<EOT >> ${conf_path}
 {
    rotate 31
    daily
    dateext
    missingok
    copytruncate
}
EOT

echo -n "generate logrotate config [${conf_path}]\n\n"
cat ${conf_path}
