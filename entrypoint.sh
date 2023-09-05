#!/bin/bash
set -e
set -x

# copied from matomo image
if [ ! -e matomo.php ]; then
	tar cf - --one-file-system -C /usr/src/matomo . | tar xf -
	chown -R www-data:www-data .

	mkdir -p /var/www/html/plugins/SecurityInfo && \
    tar xzf /plugins/plugin-*.tgz --strip-components 1 -C /var/www/html/plugins/SecurityInfo
	mkdir -p /var/www/html/plugins/LoginOIDC && \
    tar xzf /plugins/matomo-*.tgz --strip-components 1 -C /var/www/html/plugins/LoginOIDC
fi


perl -pi -e 's/Listen\s+80$/Listen 8080/g; s{<VirtualHost *:80>}{<VirtualHost *:8080>}g' /etc/apache2/ports.conf /etc/apache2/sites-enabled/000-default.conf

envsubst < /config.ini.tmpl > /var/www/html/config/config.ini.php
while IFS=',' read -ra MATOMO_TRUSTED_HOSTS; do
	for i in "${MATOMO_TRUSTED_HOSTS[@]}"; do
		perl -pi -e "s{#trusted_hosts}{trusted_hosts[] = \"$i\"\n#trusted_hosts}g" /var/www/html/config/config.ini.php
	done
done <<< "$MATOMO_TRUSTED_HOSTS"
sed -i '/#trusted_hosts/d' /var/www/html/config/config.ini.php

# dont let anyone write to it though
chmod 555 /var/www/html/config/config.ini.php

exec "$@"
