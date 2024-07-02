FROM alpine:latest as runner
WORKDIR /root/
COPY template-go /usr/bin/
ENTRYPOINT template-go
