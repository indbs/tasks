FROM alpine:3.7
RUN apk add git openjdk8 maven docker bash openssh-client
RUN mkdir p /root/.ssh
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
COPY known_hosts /root/.ssh/known_hosts
RUN chmod 600 /root/.ssh/known_hosts