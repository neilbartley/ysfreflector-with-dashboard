FROM debian:buster-slim AS builder

RUN apt-get update && \
    apt-get install -y build-essential git

RUN mkdir /ysfclients && \
    git clone https://github.com/g4klx/YSFClients.git /ysfclients && \
    cd /ysfclients/YSFReflector/ && \
    make clean all

RUN mkdir /ysfdashboard && \
    git clone https://github.com/dg9vh/YSFReflector-Dashboard.git /ysfdashboard

FROM debian:buster-slim

ENV REFLECTOR_NAME set_me
ENV REFLECTOR_DESCRIPTION set_me

RUN apt-get update && \
    apt-get install -y procps apache2 libapache2-mod-php php-cgi php-common php && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /app/logs

COPY --from=builder /ysfclients/YSFReflector/YSFReflector /ysfclients/YSFReflector/YSFReflector.ini /app/
COPY --from=builder /ysfdashboard/favicon.ico /ysfdashboard/index.php /ysfdashboard/txinfo.php /ysfdashboard/version.php /var/www/html/
COPY --from=builder /ysfdashboard/include /var/www/html/include
COPY entrypoint.sh ./
COPY config.php /var/www/html/config/

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html && \
    rm -f /var/www/html/index.html

EXPOSE 80/tcp
EXPOSE 42000/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/app/YSFReflector", "/app/YSFReflector.ini"]
HEALTHCHECK CMD ps aux | grep [Y]SFReflector || exit 1
