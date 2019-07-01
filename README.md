Based on the awesome letsencrypt nginx image from [linuxserver.io](https://github.com/linuxserver/docker-letsencrypt). Mainly used as a gatekeeper for updates to the main project.

## Changes

- (deprecated by [tls validation no longer being a thing](https://community.letsencrypt.org/t/important-what-you-need-to-know-about-tls-sni-validation-issues/50811)) Adjust certbot to use http mode to allow nginx to use [proxy_protocol](https://www.nginx.com/resources/admin-guide/proxy-protocol/) ssl listeners 
- Change the behavior of a failed intial certbot to sleep indefinitely. This avoids the container restarting constantly when certbot fails and docker parameter `--restart=unless-stopped` or `--restart=always` is used.

## Changelog
- 2019/7/1 : push for new nginx version from upstream