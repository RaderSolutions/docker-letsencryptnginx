FROM linuxserver/letsencrypt:latest

# force http validation
ENV VALIDATION http

## add a pause if cert creation fails, to avoid container restart loop quickly using all authorization attempts
## no longer needed, as upstream implemented this
## RUN for f in `grep -l certbot /etc/cont-init.d/*` ;\
##        do \
##         perl -pi.bak -e 's/\|\| exit/\|\| (echo something went wrong, sleeping forever ; sleep infinity)/' $f ;\
##         mv $f.bak /tmp ;\
##       done


copy custom-cont-init.d/ /config/custom-cont-init.d/

## Inherit entrypoint from base
