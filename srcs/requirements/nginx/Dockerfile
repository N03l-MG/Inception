FROM debian:11
RUN apt update && apt install -y nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -keyout /etc/ssl/private/nginx-selfsigned.key \
 -out /etc/ssl/private/nginx-selfsigned.cert \
 -subj "/CN=nmonzon.42.fr"
COPY ./nginx.conf /etc/nginx/nginx.conf
EXPOSE 443
CMD [ "nginx" ]