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

# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install gd

RUN docker-php-ext-install mcrypt

RUN docker-php-ext-install mysqli

RUN pecl install --onlyreqdeps --force redis \
        && rm -rf /tmp/pear \
        && docker-php-ext-enable redis

CMD ["php-fpm"]

