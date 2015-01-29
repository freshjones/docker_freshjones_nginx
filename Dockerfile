# Set the base image to debian
FROM debian:jessie

# File Author / Maintainer
MAINTAINER William Jones <billy@freshjones.com>

ENV TERM=xterm

# Update the repository sources list
RUN apt-get update && \
    apt-get install -y \
    nano \
    nginx

# set daemon to off
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#add sites enabled dir
ADD nginx/sites-enabled/ /etc/nginx/sites-enabled/

COPY app/ /app/

# clean apt cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#expose port 80
EXPOSE 80

CMD ["/usr/sbin/nginx"]
