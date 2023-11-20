FROM alpine:latest
WORKDIR /root
EXPOSE 7777
RUN apk add --update --no-cache netcat-openbsd

