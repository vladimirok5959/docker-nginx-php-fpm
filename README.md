# docker-nginx-php-fpm

Docker image with Nginx + PHP + FPM. PHP version `7.3`. Pre-installed modules: gd, mysql and curl. All env vars located here `/var/www/.env`. Document root directory here `/var/www/html`. All PHP settings defined by default except count of fpm forks, decreased to 1 and the same for Nginx server, `worker_processes` decreased to 1. Time zone can be binded at container startup from host machine by `-v /etc/timezone:/etc/timezone:ro`. Default server port is `80`.

Docker image: [https://hub.docker.com/repository/docker/vladimirok5959/nginx-php-fpm](https://hub.docker.com/repository/docker/vladimirok5959/nginx-php-fpm)

## Makefile

* **make docker-build** - build docker image
* **make docker-export** - export docker image to file
* **make docker-import** - import docker image from file
* **make docker-test** - run test container
* **make docker-push** - push image to docker hub
