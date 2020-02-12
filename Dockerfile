FROM debian:10.2-slim as builder

ADD https://github.com/gojuno/minimock/releases/download/v3.0.6/minimock_3.0.6_Linux_x86_64.tar.gz /tmp/

RUN tar -xvf /tmp/minimock_3.0.6_Linux_x86_64.tar.gz -C /tmp \
    && chmod +x /tmp/minimock

FROM golang:1.13.7-buster

COPY --from=builder /tmp/minimock /usr/local/bin/minimock

