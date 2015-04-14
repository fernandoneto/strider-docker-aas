FROM strider/strider-docker-slave:latest

ENV DB_NAME=aas_test
ENV DB_USER=aas_test
ENV DB_PASS=aas_test

ENV DEBIAN_FRONTEND=noninteractive

USER root
RUN apt-get update \
 && apt-get install -y mysql-server \
 && rm -rf /var/lib/mysql/mysql \
 && rm -rf /var/lib/apt/lists/* # 20150323

ADD start /start
RUN chmod 755 /start

EXPOSE 3306

VOLUME ["/var/lib/mysql"]
VOLUME ["/run/mysqld"]

CMD ["/start"]

USER strider
