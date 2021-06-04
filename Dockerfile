FROM pandoc/latex

ADD entrypoint.sh /entrypoint.sh
RUN apk add --no-cache font-noto
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
