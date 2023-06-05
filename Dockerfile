FROM freshrss/freshrss:1.21.0-alpine

EXPOSE 8080

ENV TZ=Europe/Berlin
ENV CRON_MIN=1,31
