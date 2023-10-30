# Extensions are installed by placing them into the mounted volume

FROM freshrss/freshrss:1.22.0-alpine

EXPOSE 80

ENV TZ=Europe/Berlin
ENV CRON_MIN=1,31

CMD ([ -z "$CRON_MIN" ] || crond -d 6) && exec httpd -D FOREGROUND
