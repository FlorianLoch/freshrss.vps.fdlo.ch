FROM alpine/git as git
RUN git clone --depth 1 https://github.com/FreshRSS/Extensions.git /freshrss_extensions

FROM freshrss/freshrss:1.21.0-alpine

EXPOSE 80

ENV TZ=Europe/Berlin
ENV CRON_MIN=1,31

# Install extensions
RUN mkdir -p /var/www/FreshRSS/extensions
COPY --from=git /freshrss_extensions/xExtension-CustomCSS /var/www/FreshRSS/extensions/xExtension-CustomCSS

CMD ([ -z "$CRON_MIN" ] || crond -d 6) && exec httpd -D FOREGROUND