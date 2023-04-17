FROM debian:bullseye

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    apache2 libapache2-mod-fcgid

# USED FOR DEBUGGING in bash (not required but usefull)
RUN apt-get update && apt-get install -y \
    vim curl

# APT CLEANUP
RUN rm -rf /var/lib/apt/lists/*
# Fix VHOST configurations so we have only our site here
RUN rm /etc/apache2/sites-enabled/*.conf
COPY ./config/apache.vhost.conf /etc/apache2/sites-enabled/local.conf

# Enable modules
RUN a2enmod actions fcgid alias proxy_fcgi mpm_event rewrite

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data

# Fix users
RUN groupadd -g 1001 www
RUN useradd -u 1000 -ms /bin/bash -g www www
RUN usermod -a -G www-data www
RUN usermod -a -G www www-data

EXPOSE 80
CMD [ "apachectl", "-D", "FOREGROUND" ]