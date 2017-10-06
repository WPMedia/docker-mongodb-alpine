FROM alpine:3.6
LABEL maintainer="cikupin@gmail.com"

# Install mongodb 3.4.4
RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add mongodb
RUN apk add mongodb-tools

#RUN mkdir /data
#RUN mkdir /data/db
#EXPOSE 27017
#CMD ["mongod"]

VOLUME /data/db

ENV AUTH yes
ENV STORAGE_ENGINE wiredTiger
ENV JOURNALING yes

ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh

EXPOSE 27017 28017

CMD ["/run.sh"]
