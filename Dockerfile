FROM alpine:3.13

LABEL maintainer="Yann Courtaux <ycourtaux@gmail.com>"

ENV MEMORY=512M
ENV UPLOAD=2048M

WORKDIR /srv

RUN addgroup -S adminer && \
    adduser -S -G adminer adminer && \
    chown -R adminer:adminer /srv && \
    apk upgrade --no-cache && \
    apk add --no-cache php7 php7-mysqli php7-session dumb-init

COPY build/adminer/ .    

EXPOSE 8080

ENTRYPOINT ["dumb-init", "--"]

CMD /usr/bin/php \
    -d memory_limit=$MEMORY \
    -d upload_max_filesize=$UPLOAD \
    -d post_max_size=$UPLOAD \
    -S 0.0.0.0:8080
