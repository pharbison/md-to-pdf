FROM pandoc/latex

ADD entrypoint.sh /entrypoint.sh
RUN apk update && apk add font-noto
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
