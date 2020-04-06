FROM alpine:latest

LABEL maintainer="pluhin@gmail.com"

RUN apk update \
    && apk upgrade \
    && apk add --no-cache nginx \
    && adduser -D -g 'www' www \
    && mkdir -p /www/test \
    && mkdir -p /run/nginx/ \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
