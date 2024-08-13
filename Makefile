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
	mkdir -p $(DATA_DIR)/mariadb
	mkdir -p $(DATA_DIR)/wordpress

# OS specific part
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    DATA_DIR := /home/$(USER)/data
else ifeq ($(UNAME_S),Darwin)
    DATA_DIR := /Users/$(USER)/data
else
    $(error Unsupported OS: $(UNAME_S))
endif