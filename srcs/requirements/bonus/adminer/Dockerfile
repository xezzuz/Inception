# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/11 18:56:19 by nazouz            #+#    #+#              #
#    Updated: 2024/11/01 18:47:48 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update

RUN apt-get install curl php php-mysql -y

COPY ./tools /tools/

WORKDIR /tools

RUN chmod +x script.sh

CMD ./script.sh