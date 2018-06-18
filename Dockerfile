FROM alpine:latest

LABEL maintainer="hicks.ronnie@gmail.com"

VOLUME [ "/config" ]

RUN apk --no-cache add git bash openssl curl
RUN git clone https://github.com/ronniehicks/dehydrated.git \
    && chmod 755 /dehydrated/dehydrated

WORKDIR /dehydrated

COPY /config/ /dehydrated/

ENTRYPOINT [ "bash", "/dehydrated/runme.sh" ]
