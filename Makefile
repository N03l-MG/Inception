env:
	@chmod +x ./srcs/tools/generate-env.sh
	./srcs/tools/generate-env.sh

up: env
	@mkdir -p ~/data
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

build:
	@sudo docker compose -f ./srcs/docker-compose.yml up --build

start:
	@sudo docker compose -f ./srcs/docker-compose.yml start

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

down: stop
	@sudo docker compose -f ./srcs/docker-compose.yml down

prune: down
	@sudo docker system prune -a
	@sudo docker volume rm $$(sudo docker volume ls -q) 2>/dev/null || true
	@sudo docker network rm $$(sudo docker network ls -q) 2>/dev/null || true
	@sudo rm -rf ~/data
	@git restore srcs/.env

.PHONY: env up build start stop down prune