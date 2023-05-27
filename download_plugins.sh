#!/bin/sh
ROOTDIR=${ROOTDIR:-./}
[ -f ./plugins/matomo-plugin-LoginOIDC-4.1.2.tgz ] || wget https://github.com/dominik-th/matomo-plugin-LoginOIDC/archive/refs/tags/4.1.2.tar.gz -O "${ROOTDIR}plugins/matomo-plugin-LoginOIDC-4.1.2.tgz"
[ -f ./plugins/plugin-SecurityInfo-4.0.2.tgz ] || wget https://github.com/matomo-org/plugin-SecurityInfo/archive/refs/tags/4.0.2.tar.gz -O "${ROOTDIR}plugins/plugin-SecurityInfo-4.0.2.tgz"

