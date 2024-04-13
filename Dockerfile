FROM alpine:latest as runner
WORKDIR /root/
COPY template /usr/bin/
ENTRYPOINT template
