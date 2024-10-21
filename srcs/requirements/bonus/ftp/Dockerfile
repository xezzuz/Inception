# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/13 10:58:41 by nazouz            #+#    #+#              #
#    Updated: 2024/10/13 12:11:58 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install vsftpd -y

COPY ./tools /tools

WORKDIR /tools

RUN chmod +x ./script.sh

CMD ./script.sh