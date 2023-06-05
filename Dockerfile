FROM freshrss/freshrss:1.21.0-alpine

EXPOSE 80

ENV TZ=Europe/Berlin
ENV CRON_MIN=1,31

CMD ([ -z "$CRON_MIN" ] || crond -d 6) && exec httpd -D FOREGROUND
