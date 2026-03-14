#!/bin/sh
sudo apt update
sudo apt install -y build-essential checkinstall zlib1g-dev
sudo wget https://github.com/openssl/openssl/releases/download/openssl-3.0.18/openssl-3.0.18.tar.gz
sudo tar -xzf openssl-3.0.18.tar.gz
cd openssl-3.0.18
CUSTOM_OPENSSL_DIR="/usr/local/openssl-3.0.18"
sudo ./config --prefix=${CUSTOM_OPENSSL_DIR} --openssldir=/usr/local/openssl-3.0.18/ssl shared zlib
sudo make -j$(nproc)
sudo make install
sudo rm openssl-3.0.18.tar.gz
sudo rm -rf openssl-3.0.18
echo "Path to files: ${CUSTOM_OPENSSL_DIR}"
${CUSTOM_OPENSSL_DIR}/bin/openssl version
