FROM node:hydrogen-alpine

RUN apk add --no-cache bash && \
    sed -i "s|/bin/sh|/bin/bash|" /etc/passwd

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

USER node
