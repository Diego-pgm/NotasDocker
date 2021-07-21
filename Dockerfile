FROM ubuntu:21.04

LABEL version=1.0
LABEL description="This is an apache image"
LABEL vendor=Diego

RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -qq -y install apache2

WORKDIR /var/www/html

COPY beryllium .

RUN echo "$(whoami)" > ./user1.html

RUN useradd Diegopgm

USER Diegopgm

RUN echo "$(whoami)" > /tmp/user2.html

USER root

RUN cp /tmp/user2.html ./user2.html

COPY run.sh /run.sh

CMD sh /run.sh
