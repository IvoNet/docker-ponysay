FROM python:alpine
LABEL maintainer="Ivo Woltring <webmaster@ivonet.nl>"

RUN apk update \
    && apk add texinfo \
    && wget -O ponysay.zip http://github.com/erkin/ponysay/archive/master.zip \
    && unzip ponysay.zip \
    && cd ponysay-master \
    && ./setup.py install --freedom=partial \
    && apk del texinfo \
    && rm -rf /ponysay.zip /ponysay-master /usr/lib/python*/__pycache__/*.pyc /var/cache/apk/*

ENTRYPOINT ["/usr/bin/ponysay"]