FROM phusion/baseimage:0.9.21

MAINTAINER Max van der Schee <m.v.d.schee@ewake.nl>

CMD ["/sbin/my_init"]

# New user is added without login and root access to only have access to the application.
RUN groupadd -r container && useradd -r -g container container

# Install core packages
RUN apt-get update -q
RUN apt-get upgrade -y -q
RUN apt-get install -y zip unzip git
RUN apt-get clean -q && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add default route for any application
WORKDIR /var/www
Run mkdir app