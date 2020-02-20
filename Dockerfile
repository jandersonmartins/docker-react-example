FROM node:alpine as build

WORKDIR /usr/src/app

COPY package.json .
COPY yarn.lock .

RUN yarn install

COPY . .

RUN yarn build

FROM nginx

COPY --from=build /usr/src/app/build /usr/share/nginx/html
