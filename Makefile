.PHONY: all up down clean

all: up

up:
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -af
	docker volume prune -f
	rm -rf ~/data/wordpress/*
	rm -rf ~/data/mariadb/*
