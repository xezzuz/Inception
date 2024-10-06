# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/01 13:55:33 by nazouz            #+#    #+#              #
#    Updated: 2024/10/03 18:53:44 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y curl php php-fpm php-mysql mariadb-client sudo

COPY ./tools /tools

WORKDIR /tools

RUN chmod +x script.sh

CMD ./script.sh