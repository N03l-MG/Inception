FROM debian:11
RUN apt update && apt install -y nginx openssl
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /var/www/html/
EXPOSE 80
CMD [ "nginx" ]