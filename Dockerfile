FROM base/archlinux

RUN [ "pacman", "-Syu", "--needed", "--noconfirm", "nginx" ]

ADD openssl.cnf /openssl/
ADD conf/global.conf /etc/nginx/conf.d/
ADD conf/nginx.conf /etc/nginx/

EXPOSE 80
EXPOSE 443

CMD [ "nginx" ]

