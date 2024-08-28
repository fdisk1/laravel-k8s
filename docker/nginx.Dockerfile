FROM node:current-alpine3.20 AS assets-build
WORKDIR /var/www/html
COPY . /var/www/html/

RUN npm init -y
RUN npm install
RUN npm run

FROM nginx:stable-alpine3.20 AS nginx
COPY /docker/package-lock.json /etc/nginx/conf.d/package-lock.json
COPY --from=assets-build /var/www/html/public /var/www/html/