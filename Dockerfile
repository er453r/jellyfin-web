FROM node:24 AS build

WORKDIR /build
COPY . .
RUN npm install

RUN npm run build:development

FROM scratch AS dist

COPY --from=build /build/dist .
