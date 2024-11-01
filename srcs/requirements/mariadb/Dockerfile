# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/28 17:18:17 by nazouz            #+#    #+#              #
#    Updated: 2024/10/30 18:16:09 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update

RUN apt-get install -y mariadb-server

COPY ./tools /tools/

WORKDIR /tools

RUN chmod +x script.sh

CMD ./script.sh
