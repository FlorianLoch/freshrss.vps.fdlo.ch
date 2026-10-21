# Extensions are installed by placing them into the mounted volume

FROM freshrss/freshrss:1.30.3 # The alpine version does not yet contain the fix to the PHP CVEs

EXPOSE 80

ENV TZ=Europe/Berlin
ENV CRON_MIN=1,31

# Only required for alpine-based images
# CMD ([ -z "$CRON_MIN" ] || crond -d 6) && exec httpd -D FOREGROUND
