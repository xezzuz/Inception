# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/02 13:40:35 by nazouz            #+#    #+#              #
#    Updated: 2024/11/02 13:40:39 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update

RUN apt-get install php -y

COPY ./tools /tools/

WORKDIR /tools

RUN chmod +x script.sh

CMD ./script.sh