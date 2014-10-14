FROM phusion/passenger-ruby21:0.9.12
MAINTAINER Adit Saxena "a.saxena.email@gmail.com"

ENV HOME /root

CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN mkdir /home/app/webapp

WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install

ADD . /home/app/webapp

RUN cd /home/app/webapp && RAILS_ENV=production rake assets:precompile

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 22
