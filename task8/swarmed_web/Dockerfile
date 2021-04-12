FROM alpine:3.7

ARG DEST_PATH
ENV DP=$DEST_PATH

RUN apk add openjdk8
RUN apk add --no-cache --virtual .service-package wget git

RUN  mkdir ${DEST_PATH}/tomcat/
WORKDIR ${DEST_PATH}/tomcat/
RUN wget https://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.tar.gz -O /tmp/tomcat9.0.45.tar.gz \
        && tar xvfz /tmp/tomcat9.0.45.tar.gz -C /tmp \
        && cp -Rv /tmp/apache-tomcat-9.0.45/* ${DEST_PATH}/tomcat/ \
        && rm -rf /tmp
WORKDIR ${DEST_PATH}/tomcat/webapps
RUN git clone https://github.com/indbs/artifacts.git

RUN apk del .service-package

EXPOSE 8080

CMD ${DP}/tomcat/bin/catalina.sh run
