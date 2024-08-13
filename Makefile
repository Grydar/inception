.PHONY: all up down clean

all: up

up: create_dirs
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -af
	docker volume rm srcs_mariadb_data srcs_wordpress_data
	rm -rf ~/data/wordpress/*
	rm -rf ~/data/mariadb/*

create_dirs:
	sudo mkdir -p ~/data/mariadb
	sudo mkdir -p ~/data/wordpress