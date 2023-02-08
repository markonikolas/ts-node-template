FROM node:lts-alpine as base

WORKDIR /app

COPY . .

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm

RUN pnpm install

EXPOSE 8080

FROM base as dev

ENV NODE_ENV=development

VOLUME [ "./app" ]

CMD ["pnpm", "run", "watch"]

FROM base as prod

RUN ["pnpm", "run", "build"]

ENV NODE_ENV=production

CMD ["pnpm", "start"]
