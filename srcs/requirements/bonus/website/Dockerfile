# 42Header

FROM debian:bullseye

RUN apt-get update

RUN apt-get install php -y

COPY ./tools /tools/

WORKDIR /tools

RUN chmod +x script.sh

CMD ./script.sh