FROM alpine:3.7

ARG DEST_PATH
ENV DP=$DEST_PATH

RUN apk add openjdk8
RUN apk add --no-cache --virtual .service-package wget

WORKDIR ${DEST_PATH}/tomcat/
RUN wget https://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz -O /tmp/tomcat9.0.46.tar.gz \
        && tar xvfz /tmp/tomcat9.0.46.tar.gz -C /tmp \
        && cp -Rv /tmp/apache-tomcat-9.0.46/* ${DEST_PATH}/tomcat/ \
        && rm -rf /tmp

ADD hello-1.0.war ${DEST_PATH}/tomcat/webapps/

RUN apk del .service-package

EXPOSE 8080

CMD ${DP}/tomcat/bin/catalina.sh run
