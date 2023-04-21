FROM node:lts-alpine as web-builder

RUN apk add curl git zlib zlib-dev autoconf g++ make libpng-dev gifsicle alpine-sdk automake libtool make gcc musl-dev nasm python3

WORKDIR /source
COPY jellyfin-web/ .

RUN set -xe \
    && npm ci --no-audit --unsafe-perm \
    && npm run build:production

FROM nginx:stable

COPY --from=web-builder /source/dist /jellyfin-web
COPY rootfs/ /
