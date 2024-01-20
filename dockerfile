FROM alpine:latest

WORKDIR /cloudreve

ENV ARIA2_RPC_SECRET=your_token

RUN apk update \
    && apk add --no-cache tzdata wget aria2 \
    && wget https://github.com/cloudreve/Cloudreve/releases/download/3.8.3/cloudreve_3.8.3_linux_amd64.tar.gz -O cloudreve_latest.tar.gz \
    && tar -zxvf cloudreve_latest.tar.gz \
    && rm cloudreve_latest.tar.gz \
    && chmod +x ./cloudreve \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /data/aria2 \
    && chmod -R 766 /data/aria2 \
    && echo "dir=/data/aria2\ncontinue=true\nmax-connection-per-server=5\nmin-split-size=10M\nsplit=10\nmax-overall-download-limit=0\nmax-download-limit=0\ndaemon=true\nenable-rpc=true\nrpc-allow-origin-all=true\nrpc-listen-all=true\nrpc-listen-port=6800\nrpc-secret=${ARIA2_RPC_SECRET}" > /data/aria2/aria2.conf

EXPOSE 5212 6800
VOLUME ["/cloudreve/uploads", "/cloudreve/avatar", "/data"]

CMD echo "Aria2 RPC Secret: ${ARIA2_RPC_SECRET}" && ./cloudreve

