FROM matomo:4.14.2-apache

RUN set -ex && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    gettext-base=0.21-4 \
    wget=1.21-1+deb11u1 && \
  apt clean && \
	rm -rf /var/lib/apt/lists/*

COPY download_plugins.sh entrypoint.sh /
RUN chmod 755 /entrypoint.sh /download_plugins.sh && mkdir /plugins && cd / && /download_plugins.sh

COPY config.ini.php /config.ini.tmpl

