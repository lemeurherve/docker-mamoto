FROM matomo:4.15.1-apache

RUN set -ex && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    gettext-base \
    wget && \
  apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY download_plugins.sh entrypoint.sh /
RUN chmod 755 /entrypoint.sh /download_plugins.sh && \
  mkdir /plugins && \
  ROOTDIR=/ /download_plugins.sh

COPY config.ini.php /config.ini.tmpl
