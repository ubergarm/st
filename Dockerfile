FROM alpine

MAINTAINER ubergarm

RUN apk add --update \
    st \
    ttf-liberation \
 && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/st"]
