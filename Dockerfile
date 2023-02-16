FROM node:lts-alpine as base

RUN apk add curl

RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm

WORKDIR /usr/src/app

COPY --chown=node:node pnpm-lock.yaml ./

COPY --chown=node:node . .

FROM base as dev

ENV NODE_ENV=development

VOLUME [ "/usr/src/app/node_modules" ]

RUN pnpm fetch

RUN pnpm install -r --offline 

EXPOSE ${APP_DEV_PORT}

USER node

CMD ["pnpm", "run", "watch"]
