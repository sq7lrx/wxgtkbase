FROM alpine:3.11
LABEL maintainer="Adam Kolakowski SQ7LRX" 
ARG WXGTK_VERSION
ARG BUILD_DATE
LABEL build-date=$BUILD_DATE

RUN apk add --update --no-cache \
    wxgtk-base=$WXGTK_VERSION \
 && rm -rf /var/cache/apk/* \
 && mkdir -p /app

WORKDIR /app
