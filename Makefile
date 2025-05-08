all: up

up:
	@mkdir /home/irisirl/data
	@mkdir /home/irisirl/data/wordpress
	@mkdir /home/irisirl/data/db
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

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
	@sudo rm -rf /home/irisirl/data

.PHONY: up build down stop start prune