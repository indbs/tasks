FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y \
        git \
        default-jdk \
        maven
#RUN mkdir -p /usr/local/builddir
WORKDIR /usr/local/builddir
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package