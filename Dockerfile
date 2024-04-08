FROM alpine:latest as runner
WORKDIR /root/
COPY app /usr/bin/
ENTRYPOINT app
