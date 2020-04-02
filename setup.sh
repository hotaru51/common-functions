#!/bin/bash
set -ue

shl_dir=$(cd $(dirname $0); pwd)
base_dir=$(cd $(dirname ${shl_dir}); pwd)

# mkdir
for name in "conf" "log" "tmp"
do
    dir_name="${base_dir}/${name}"
    if [ ! -d "${dir_name}" ]; then
        echo "create directory ${dir_name}"
        mkdir ${dir_name}
    fi
done

# .gitignore
echo 'add the log and tmp directories to .gitignore'
cat <<_EOT_ >> ${base_dir}/.gitignore
/log/
/tmp/
_EOT_
