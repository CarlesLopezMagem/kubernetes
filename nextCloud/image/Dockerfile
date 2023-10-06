FROM nextcloud:27-fpm-alpine

RUN set -ex; \
    \
    apk add --no-cache \
    ffmpeg \
    imagemagick \
    procps \
    samba-client \
    supervisor \
    # libreoffice \
    ;

RUN set -ex; \
    \
    apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    imap-dev \
    krb5-dev \
    openssl-dev \
    samba-dev \
    bzip2-dev \
    ; \
    \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install \
    bz2 \
    imap \
    ; \
    pecl install smbclient; \
    docker-php-ext-enable smbclient; \
    \
    runDeps="$( \
    scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
    | tr ',' '\n' \
    | sort -u \
    | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )"; \
    apk add --virtual .nextcloud-phpext-rundeps $runDeps; \
    apk del .build-deps

RUN mkdir -p \
    /var/log/supervisord \
    /var/run/supervisord \
    ;

# Cron
RUN echo "*/5 * * * * php -f /var/www/html/cron.php" >> /etc/crontabs/www-data 

# Preview CronJob
RUN echo "*/10 * * * * php /var/www/html/occ preview:pre-generate" >> /etc/crontabs/www-data


ENV PHP_MEMORY_LIMIT 2048M
# RUN echo "memory_limit=2048M" > /usr/local/etc/php/conf.d/memory-limit.ini


COPY supervisord.conf /

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
