FROM node:current-alpine3.20 AS assets-build
WORKDIR /var/www/html
COPY . /var/www/html/

# if your application is not using any frontend frameworks 
# and isn't required to install any Javascript packages with npm, 
# remove the two lines of npm in the dockerfile.
# RUN npm ci
# RUN npm run development

FROM nginx:stable-alpine3.20 AS nginx
COPY /docker/vhost.conf /etc/nginx/conf.d/default.conf
COPY --from=assets-build /docker/index.html /var/www/html/
# COPY --from=assets-build /var/www/html/public /var/www/html/