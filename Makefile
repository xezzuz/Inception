# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/10 18:21:30 by nazouz            #+#    #+#              #
#    Updated: 2024/10/10 18:21:31 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: start

start:
	docker compose up -f ./srcs/docker-compose.yml -d --build

stop:
	docker compose down -f ./srcs/docker-compose.yml

clean: stop
	rm -rf /home/nazouz/data/*
	mkdir -p /home/nazouz/mariadb
	mkdir -p /home/nazouz/wordpress
	docker system prune -af