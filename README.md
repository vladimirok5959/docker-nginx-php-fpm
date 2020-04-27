# docker-nginx-php-fpm

Docker base image with Nginx + PHP + FPM. PHP version `7.3`. Pre-installed modules: gd, mysql and curl. All env vars located here `/var/www/.env`. Document root directory here `/var/www/html`. All PHP settings defined by default except count of fpm forks, decreased to 1 and the same for Nginx server, `worker_processes` decreased to 1. Time zone can be binded at container startup from host machine by `-v /etc/timezone:/etc/timezone:ro`. Default server port is `80`.

Docker image: [https://hub.docker.com/repository/docker/vladimirok5959/nginx-php-fpm](https://hub.docker.com/repository/docker/vladimirok5959/nginx-php-fpm)

## Makefile

* **make docker-build** - build docker image
* **make docker-export** - export docker image to file
* **make docker-import** - import docker image from file
* **make docker-test** - run test container
* **make docker-push** - push image to docker hub

## Read ENVs from PHP

```php
function LoadEnvironmentVariables() {
    $f = '../.env';
    if(file_exists($f)) {
        foreach(explode("\n", file_get_contents($f)) as $value) {
            if(trim($value) != '') {
                $pos = strpos($value, '=');
                if($pos === false) continue;
                $_ENV[substr($value, 0, $pos)] = substr($value, $pos + 1, strlen($value) - $pos - 1);
            }
        }
    }
}

// Example:
LoadEnvironmentVariables();
var_dump($_ENV);
```

## Running docker container

```sh
docker run \
    --network host \
    --name my-container-name \
    -v /etc/timezone:/etc/timezone:ro \
    -v /path/to/php/files:/var/www/html \
    -d -it vladimirok5959/nginx-php-fpm:latest
```

Host network just for example, `-v /etc/timezone:/etc/timezone:ro` for getting time zone from host machine and `-v /path/to/php/files:/var/www/html` for rebind htdocs/www directory with PHP files, just for example if this image used as standalone without inheriting.
