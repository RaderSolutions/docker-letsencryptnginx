Based on the awesome letsencrypt nginx image from [linuxserver.io](https://github.com/linuxserver/docker-letsencrypt) 

## Changes

- Adjust certbot to use http mode to allow nginx to use [proxy_protocol](https://www.nginx.com/resources/admin-guide/proxy-protocol/) listeners
- Change the behavior of a failed intial certbot to sleep indefiitely. This avoids the container restarting constantly when certbot fails and docker parameter `--restart=unless-stopped` or `--restart=always` is used.