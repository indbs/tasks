FROM alpine:3.7

ARG DEST_PATH
ENV DP=$DEST_PATH

RUN apk update \
        && apk add openjdk8 \
        && apk add wget

WORKDIR ${DEST_PATH}/tomcat/
RUN wget https://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.tar.gz -O /tmp/tomcat9.0.45.tar.gz

WORKDIR /tmp/
RUN tar xvfz /tmp/tomcat9.0.45.tar.gz \
        && cp -Rv /tmp/apache-tomcat-9.0.45/* ${DEST_PATH}/tomcat/

EXPOSE 8080

CMD ${DP}/tomcat/bin/catalina.sh run