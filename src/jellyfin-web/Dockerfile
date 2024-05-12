ARG NODEJS_VERSION=20

FROM node:${NODEJS_VERSION}-alpine as web

ARG SOURCE_DIR=/src
ARG ARTIFACT_DIR=/web

ARG JELLYFIN_VERSION
ENV JELLYFIN_VERSION=${JELLYFIN_VERSION}

RUN apk add \
    autoconf \
    g++ \
    make \
    libpng-dev \
    gifsicle \
    alpine-sdk \
    automake \
    libtool \
    gcc \
    musl-dev \
    nasm \
    python3

WORKDIR ${SOURCE_DIR}
COPY jellyfin-web .

RUN npm ci --no-audit --unsafe-perm \
    && npm run build:production \
    && mv dist ${ARTIFACT_DIR}

FROM nginx:stable

COPY --from=web /web /web
COPY rootfs/ /
