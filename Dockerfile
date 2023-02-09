FROM node:lts-alpine as base

WORKDIR /app

COPY . .

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm

RUN pnpm install

FROM base as dev

ENV NODE_ENV=development

EXPOSE ${APP_DEV_PORT}

VOLUME [ "./app" ]

CMD ["pnpm", "run", "watch"]

FROM base as prod

VOLUME [ "/app/dist" ]

RUN ["pnpm", "run", "build"]

ENV NODE_ENV=production

EXPOSE ${APP_PROD_PORT}

CMD ["pnpm", "start"]
