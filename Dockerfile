FROM debian:10.2-slim as builder

ENV MINIMOCK_VERSION 3.0.6

ADD https://github.com/gojuno/minimock/releases/download/v$MINIMOCK_VERSION/minimock_${MINIMOCK_VERSION}_Linux_x86_64.tar.gz /tmp/

RUN tar -xvf /tmp/minimock_${MINIMOCK_VERSION}_Linux_x86_64.tar.gz -C /tmp \
    && chmod +x /tmp/minimock

FROM golang:1.13.7-buster

COPY --from=builder /tmp/minimock /usr/local/bin/minimock

