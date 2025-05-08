all: up

up:
#@mkdir /home/nmonzon/data/wordpress
# @mkdir /home/nmonzon/data/db
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

start:
	@sudo docker compose -f ./srcs/docker-compose.yml start

prune: down
	@sudo docker system prune -a