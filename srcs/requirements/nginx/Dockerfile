# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/30 16:30:16 by nazouz            #+#    #+#              #
#    Updated: 2024/09/30 18:23:08 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y nginx openssl

COPY ./tools/default.conf /etc/nginx/conf.d/

COPY ./tools /tools

WORKDIR /tools

RUN chmod +x ./script.sh

CMD ./script.sh
