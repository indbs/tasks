FROM ubuntu:16.04

ARG BUILD_PATH
ARG BUILD_OUT
ARG DEST_PATH

ENV DP=$DEST_PATH
ENV BO=$BUILD_OUT
ENV BP=$BUILD_PATH

RUN apt-get update
RUN apt-get install -y \
        git \
        default-jdk \
        maven \
        mc
RUN mkdir -p "${DEST_PATH}/${BUILD_PATH}"
#       && mkdir -p "${DEST_PATH}/${BUILD_OUT}" created by volume definition

CMD cd "${DP}/${BP}" \
        && rm -rf \
        && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git \
        && cd boxfuse-sample-java-war-hello \
        && mvn package \
        && cp -R ${DP}/${BP}/boxfuse-sample-java-war-hello/target/* "${DP}/${BO}"
