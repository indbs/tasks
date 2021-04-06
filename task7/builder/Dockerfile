FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y \
        git \
        default-jdk \
        maven
RUN mkdir -p /usr/local/builddir \
        && cd /usr/local/builddir \
        && mkdir -p /usr/local/buildout \
        && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git \
        && cd boxfuse-sample-java-war-hello \
        && mvn package
CMD cp -R /usr/local/builddir/boxfuse-sample-java-war-hello/target/* /usr/local/buildout
