# This repository is deprecated.
# Instead use: [https://github.com/majdarbash/docker-chef-nginx](https://github.com/majdarbash/docker-chef-nginx)

# docker-chef-solo-skeleton
Required files and explanation to provision docker image with chef-solo using custom cookbooks

For extended documentation read:
[http://www.what2web.com/building-nginx-cookbook-in-dockerized-container](http://www.what2web.com/building-nginx-cookbook-in-dockerized-container)

Published on:
https://hub.docker.com/r/majdarbash/nginx/

On your local machine try:
> docker run -v [local_dir_path]:/app -p 8080:80 -d majdarbash/nginx

> docker pull majdarbash/nginx

> docker build -t majdarbash/nginx .
