#!/bin/sh

set -eux

sudo apt install -y curl

sudo mkdir -p /etc/apt/keyrings

if ! [ -f /etc/apt/sources.list.d/intel-sgx.list ]; then
    echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/intel-sgx-deb.gpg] https://download.01.org/intel-sgx/sgx_repo/ubuntu focal main' \
        | sudo tee /etc/apt/sources.list.d/intel-sgx.list
fi
if ! [ -f /etc/apt/keyrings/intel-sgx-deb.gpg ]; then
    curl -fsSL https://download.01.org/intel-sgx/sgx_repo/ubuntu/intel-sgx-deb.key \
        | gpg --dearmor \
        | sudo tee /etc/apt/keyrings/intel-sgx-deb.gpg >/dev/null
fi

if ! [ -f /etc/apt/sources.list.d/msprod.list ]; then
    echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/20.04/prod focal main' \
        | sudo tee /etc/apt/sources.list.d/msprod.list
fi
if ! [ -f /etc/apt/keyrings/microsoft.gpg ]; then
    curl -fsSL /etc/apt/trusted.gpg.d/microsoft.asc https://packages.microsoft.com/keys/microsoft.asc \
        | gpg --dearmor \
        | sudo tee /etc/apt/keyrings/microsoft.gpg >/dev/null
fi

sudo apt update
sudo apt upgrade -y
sudo apt install -y \
    az-dcap-client \
    build-essential \
    libmbedtls12 \
    libmbedtls-dev \
    libssl-dev \
    mpich \
    open-enclave

if ! grep openenclaverc ~/.bashrc; then
    (echo && echo 'source /opt/openenclave/share/openenclave/openenclaverc') >> ~/.bashrc
fi
