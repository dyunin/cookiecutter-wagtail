FROM nginx:stable-alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY ./compose/production/nginx/default.conf /etc/nginx/conf.d
