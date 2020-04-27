VERSION="1.0.0"

docker-build:
	@-docker rmi docker-nginx-php-fpm:latest
	docker build -t docker-nginx-php-fpm:latest ./

docker-export:
	@-rm ./build/docker-nginx-php-fpm.tar
	docker save docker-nginx-php-fpm:latest > ./build/docker-nginx-php-fpm.tar

docker-import:
	@-docker rmi docker-nginx-php-fpm:latest
	docker load < ./build/docker-nginx-php-fpm.tar

docker-test:
	docker run --rm \
		--network host \
		--name docker-nginx-php-fpm-test \
		-v /etc/timezone:/etc/timezone:ro \
		-it docker-nginx-php-fpm:latest

docker-push:
	docker tag docker-nginx-php-fpm:latest vladimirok5959/nginx-php-fpm:${VERSION}
	docker tag docker-nginx-php-fpm vladimirok5959/nginx-php-fpm:latest
	docker login
	docker push vladimirok5959/nginx-php-fpm:${VERSION}
	docker push vladimirok5959/nginx-php-fpm:latest
	docker rmi vladimirok5959/nginx-php-fpm:${VERSION}
	docker rmi vladimirok5959/nginx-php-fpm:latest
	docker rmi docker-nginx-php-fpm:latest
