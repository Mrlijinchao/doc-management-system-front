FROM nginx

COPY ./web/dist/ /usr/share/nginx/html/

COPY ./web/nginx/default.conf /etc/nginx/conf.d/default.conf
