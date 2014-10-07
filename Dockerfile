# === 1 ===
FROM phusion/passenger-ruby21:0.9.12
MAINTAINER Adit Saxena "a.saxena.email@gmail.com"

# Add user so that container does not run as root
RUN useradd -m deployer2312
RUN echo "deployer2312:pwd-24132f342l;ka4" | chpasswd
RUN usermod -s /bin/bash deployer2312
RUN usermod -aG sudo deployer2312
ENV HOME /home/deployer2312
ENV HOSTNAME deployer2312

# ENV HOME /root

CMD ["/sbin/my_init"]

# === 2 ===
RUN rm -f /etc/service/nginx/down

# === 3 ====
RUN rm /etc/nginx/sites-enabled/default

# Add the nginx info
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

# === 4 ===
# Prepare folders
RUN mkdir /home/app/webapp

# === 5 ===
# Run Bundle in a cache efficient way
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install

# === 6 ===
# Add the rails app
ADD . /home/app/webapp

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo 'root:pwd-24132f342l;ka4' |chpasswd

EXPOSE 80 22
