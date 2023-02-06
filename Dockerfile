FROM node:lts-alpine as base

WORKDIR /app

COPY ./src /app/

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm

RUN pnpm install

EXPOSE 8080

FROM base as dev

ENV NODE_ENV=development

CMD ["pnpm", "run", "watch"]

FROM base as prod

RUN mkdir -p dist && \
    chown 1000:1000 -R dist && \
    chmod 755 -R dist

ENV NODE_ENV=production

VOLUME [ "/app/dist" ]

CMD ["pnpm", "start"]
