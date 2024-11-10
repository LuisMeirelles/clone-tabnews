FROM node:hydrogen-alpine AS base

WORKDIR /app

COPY package*.json .

FROM base AS development

RUN apk add --no-cache bash && \
    sed -i "s|/bin/sh|/bin/bash|" /etc/passwd

RUN npm install

COPY . .

USER node

CMD ["npm", "run", "dev"]

FROM base AS production

ENV NODE_ENV=production

RUN npm install

COPY . .

RUN npm run build

USER node

CMD ["npm", "start"]
