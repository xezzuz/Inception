# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/10 18:21:30 by nazouz            #+#    #+#              #
#    Updated: 2024/10/23 15:38:04 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build

build:
	mkdir -p /home/nazouz/data/mariadb
	mkdir -p /home/nazouz/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up -d --build

start:
	docker compose -f ./srcs/docker-compose.yml up -d

stop:
	docker compose -f ./srcs/docker-compose.yml down

clean: stop
	docker system prune -af

dbclean:
	rm -rf /home/nazouz/data/wordpress/*
	rm -rf /home/nazouz/data/mariadb/*
