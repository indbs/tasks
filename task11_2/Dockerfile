FROM alpine:3.7
RUN apk add git openjdk8 maven docker bash openssh-client
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
