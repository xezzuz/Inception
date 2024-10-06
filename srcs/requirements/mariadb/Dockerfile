# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/28 17:18:17 by nazouz            #+#    #+#              #
#    Updated: 2024/09/30 16:33:47 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y mariadb-server

# Copy mariadb config file from host machine to the container
COPY ./tools /tools/

# change woking directory
WORKDIR /tools

# change its permissions
RUN chmod +x script.sh

# run the script when the container starts
CMD ./script.sh
