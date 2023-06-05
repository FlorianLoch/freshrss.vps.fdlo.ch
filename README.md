# FreshRSS in Dokku

This repository contains the configuration of the FreshRSS instance running at rss.vps.fdlo.ch.

Add a git remote for Dokku:
```bash
git remote add dokku dokku@vps.fdlo.ch:freshrss
```

Additionally, some setup with Dokku is necessary:

As a general setup for FreshRSS but also all other services:
```bash
# Needs to be done just once for all projects
sudo dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
sudo dokku plugin:install https://github.com/dokku/dokku-event-listener.git

dokku config:set --global DOKKU_LETSENCRYPT_EMAIL=me@fdlo.ch
dokku letsencrypt:cron-job --add
```

Specifically for FreshRSS:
```bash
dokku apps:create freshrss
dokku storage:mount freshrss /apps/freshrss:/var/www/FreshRSS

cd /apps && mkdir ./freshrss && chown nobody freshrss

# App needs to be deployed once before calling this
dokku proxy:ports-set freshrss http:80:8080
dokku domains:remove freshrss freshrss.fdlo.ch freshrss.vps.fdlo.ch
dokku domains:add freshrss rss.vps.fdlo.ch

dokku letsencrypt:enable freshrss
```