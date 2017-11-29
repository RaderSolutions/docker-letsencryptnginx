FROM linuxserver/letsencrypt:latest


# adjust certbot to use http mode 
## add a pause if cert creation fails, to avoid container restart loop quickly using all authorization attempts
#RUN sed 's#^certbot.*$#certbot -n renew --webroot /config/www --post-hook "s6-svc -d /var/run/s6/services/nginx ; s6-svc -u /var/run/s6/services/nginx ; cd /config/keys/letsencrypt \&\& openssl pkcs12 -export -out privkey.pfx -inkey privkey.pem -in cert.pem -certfile chain.pem -passout pass:"#' -i /app/le-renew.sh \
RUN sed 's#--standalone#--standalone --preferred-challenges http#' -i /app/le-renew.sh \
    && for f in `grep -l certbot /etc/cont-init.d/*` ;\
        do \
         perl -pi.bak -e 's/--pref(.*?)--/--preferred-challenges http --/g; s/\|\| exit/\|\| (echo something went wrong, sleeping forever ; sleep infinity)/' $f ;\
         mv $f.bak /tmp ;\
       done \
    && 




## Inherit entrypoint from base
