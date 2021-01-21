# Download debian buster image from Dockerhub
FROM debian:buster

# Copy srcs folder from host to the container root
COPY /srcs /root

# Install and update the following packages (apt, nginx, mariadb e php)
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y wget \
    nginx \
    mariadb-server \
    php7.3 \
    php-fpm \
    php-mysql \
    php-cli \
    php-mbstring && \
    bash /root/server-config.sh

# From bash, execute start.sh (starts nginx, mysql, php)
    ENTRYPOINT bash /root/start.sh

# Execute the container
    CMD tail -f /dev/null

# https://stackoverflow.com/questions/48957195/how-to-fix-docker-got-permission-denied-issue