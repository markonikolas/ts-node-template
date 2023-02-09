FROM node:lts-alpine as base

RUN apk add curl

RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm

WORKDIR /usr/src/app

COPY --chown=node:node pnpm-lock.yaml ./

RUN pnpm fetch --prod

RUN pnpm install -r --offline --prod

COPY --chown=node:node . .

USER node

FROM base as dev

ENV NODE_ENV=development

EXPOSE ${APP_DEV_PORT}

VOLUME [ "./app" ]

CMD ["pnpm", "run", "watch"]

FROM base as prod

VOLUME [ "./app/dist" ]

RUN ["pnpm", "run", "build"]

ENV NODE_ENV=production

EXPOSE ${APP_PROD_PORT}

CMD ["pnpm", "start"]
