#!/bin/bash

set -euo pipefail

# https://stackoverflow.com/a/4774063
SCRIPTPATH="$( cd -- "$(dirname "$0")" > /dev/null 2>&1 ; pwd -P )"
ROOTPATH="$( dirname "${SCRIPTPATH}" )"

if [ $# -lt 2 ]; then
    echo "Usage: $0 <first> <last>"
    exit 1
fi

first=$1
last=$2

mkdir -p ${ROOTPATH}

i=$first
while [ "$i" -le "$last" ]; do
    (
        ssh enclave${i} mkdir -p ${ROOTPATH}
        rsync \
            -aiv \
            --progress \
            --exclude benchmarks \
            --delete \
            "${ROOTPATH}/" \
            enclave${i}:"${ROOTPATH}/" \
            || true
    ) &
    i=$(( i + 1 ))
done

wait
