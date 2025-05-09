all: up

up: generate-env
	@mkdir -p ~/data
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

generate-env:
	@chmod +x ./srcs/tools/generate-env.sh
	./srcs/tools/generate-env.sh

build:
	@sudo docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

start:
	@sudo docker compose -f ./srcs/docker-compose.yml start

prune: down
	@sudo docker system prune -a
	@sudo rm -rf ~/data

.PHONY: up build down stop start prune
