# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nazouz <nazouz@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/30 17:18:18 by nazouz            #+#    #+#              #
#    Updated: 2024/10/03 19:26:19 by nazouz           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

chown -R www-data:www-data /var/www/html

openssl req -x509 -nodes \
		-keyout /etc/ssl/private/nazouz.42.fr.key \
		-out /etc/ssl/certs/nazouz.42.fr.crt \
		-subj "/C=MA/ST=BM/L=KH/O=42/OU=student/CN=nazouz.42.fr"

nginx -g "daemon off;"