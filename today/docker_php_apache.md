# PHP APACHE #

## Keng ##

- no new user

### docker-compose visit mysql connection refused ###

- `docker inspect [mysql_container]`: get container's ip address
- use that `ip` in `new mysqli();` in php


### VHOST on Linux ###

`hmDocker` developing notes:

- `000-default.conf` in `sites-available` will configure the
  `DocumentRoot` of apache2. No matter whatever you configure in
  other `.conf` files, the `DocumentRoot` won't
  change (todo:why?). There are answers said that the precedence
  appear in `httpd` do matters. But on Linux I didn't see any
  `httpd` file. 
- Under the above case the php src code should be in
  `DocumentRoot` configured in `000-default.conf`.
- `sites-enabled` `sites-available`: in `DigitalOcean`'s tutorial
  it saves `.conf` file in `sites-available` then uses `a2ensite`
  to enable it (which will symlink file in available to enabled).
  However I copy the `.conf` file directly into `sites-enabled`
  and do work.
  
  `IncludeOption` (scan *.conf files) is configured in
  `apache2.conf`.
  
  Still not sure what `a2ensite` does other than symlink.

- I didn't make any changes in `/etc/hosts` don't know why it works.



