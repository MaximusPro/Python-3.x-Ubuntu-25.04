#!/bin/sh
sudo apt install libssl-dev libffi-dev zlib1g-dev build-essential
sudo wget https://www.python.org/ftp/python/3.7.16/Python-3.7.16.tgz
sudo tar -xzf Python-3.7.16.tgz
cd Python-3.7.16

OPENSSL_DIR="/usr/local/openssl-3.0.18"
CUSTOM_PYTHON_DIR="/usr/local/python-3.7.16-custom"
export CPPFLAGS="-I${OPENSSL_DIR}/include"
export LDFLAGS="-L${OPENSSL_DIR}/lib -Wl,-rpath,${OPENSSL_DIR}/lib"
export LD_LIBRARY_PATH="${OPENSSL_DIR}/lib:${LD_LIBRARY_PATH}"
export PKG_CONFIG_PATH="${OPENSSL_DIR}/lib/pkgconfig:${PKG_CONFIG_PATH}"
echo $LDFLAGS

sudo ./configure --prefix=${CUSTOM_PYTHON_DIR} --enable-optimizations --with-ensurepip=install

make -j$(nproc)
sudo make altinstall
cd ..
sudo rm Python-3.7.16.tgz
sudo rm -rf Python-3.7.16
echo "Path to Python: ${CUSTOM_PYTHON_DIR}"
${CUSTOM_PYTHON_DIR}/bin/python3 --version

