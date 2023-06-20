FROM dreamacro/clash

ARG CONFIG_URL=""
ENV CONFIG_URL=$CONFIG_URL

ARG UPDATE_INTERVAL=3600
ENV UPDATE_INTERVAL=$UPDATE_INTERVAL

RUN apk --no-cache add curl

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT []
CMD ["/bin/sh", "-c", "/entrypoint.sh"]
