.PHONY: all up down clean

all: up

up: create_dirs
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -af
	rm -rf ~/data
	docker volume rm srcs_mariadb_data srcs_wordpress_data

create_dirs:
	mkdir -p ~/data
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress