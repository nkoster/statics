FROM --platform=${TARGETPLATFORM:-linux/amd64} node:12.13.0-alpine as ship

WORKDIR /home/app

COPY . .

RUN \
    apk --no-cache add curl ca-certificates && \
    addgroup -S app && adduser -S -g app app && \
    mkdir -p /home/app && \
    npm i && \
    chown app:app -R /home/app && \
    chmod 777 /tmp

USER app

CMD ["/usr/local/bin/node", "index.js"]
