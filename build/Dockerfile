ARG         ALPINE_IMAGE="alpine:latest"

FROM        ${ALPINE_IMAGE}

LABEL       maintainer="https://github.com/unimock"

RUN         apk add --upgrade --no-cache \
                    tzdata \
                    nginx \
            && \
            rm -rf /var/cache/apk/*
#
# nginx
#
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY        entry.sh /
RUN         chmod a+x /entry.sh
EXPOSE      80
ENTRYPOINT  ["/entry.sh"]
