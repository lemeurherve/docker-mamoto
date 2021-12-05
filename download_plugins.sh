#!/bin/sh
[ -f ./plugins/matomo-plugin-LoginOIDC-4.1.2.tgz ] || wget https://github.com/dominik-th/matomo-plugin-LoginOIDC/archive/refs/tags/4.1.2.tar.gz -O ./plugins/matomo-plugin-LoginOIDC-4.1.2.tgz
[ -f ./plugins/plugin-SecurityInfo-4.0.2.tgz ] || wget https://github.com/matomo-org/plugin-SecurityInfo/archive/refs/tags/4.0.2.tar.gz -O ./plugins/plugin-SecurityInfo-4.0.2.tgz

