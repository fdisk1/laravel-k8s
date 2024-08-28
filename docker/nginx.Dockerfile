FROM node:current-alpine3.20 AS assets-build
WORKDIR /var/www/html
COPY . /var/www/html/

RUN npm install
RUN npm run development

FROM nginx:stable-alpine3.20 AS nginx
COPY /docker/vhost.conf /etc/nginx/conf.d/default.conf
COPY --from=assets-build /var/www/html/public /var/www/html/