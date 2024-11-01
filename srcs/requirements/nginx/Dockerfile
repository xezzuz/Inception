# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/30 16:30:16 by nazouz            #+#    #+#              #
#    Updated: 2024/11/01 12:49:52 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update

RUN apt-get install -y nginx openssl

COPY ./tools/default.conf /etc/nginx/conf.d/

RUN openssl req -x509 -nodes \
	-keyout /etc/ssl/private/nazouz.42.fr.key \
	-out /etc/ssl/certs/nazouz.42.fr.crt \
	-subj "/C=MA/ST=BM/L=KH/O=42/OU=student/CN=nazouz.42.fr"

CMD ["nginx", "-g", "daemon off;"]