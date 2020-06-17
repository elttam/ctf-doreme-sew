FROM phusion/passenger-ruby24:0.9.35

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD nginx/app.conf /etc/nginx/sites-enabled/app.conf


ADD readflag.c /readflag.c
ADD flag.txt /flag.txt
RUN groupadd flag && \
  gcc /readflag.c -o /readflag && \
  chown root:flag /readflag && \
  chmod 2755 /readflag && \
  rm /readflag.c && \
  chown root:flag /flag.txt && \
  chmod 040 /flag.txt


COPY webapp/ /home/app/webapp
RUN gem update --system
RUN bundle install --gemfile /home/app/webapp/Gemfile


RUN chown -R root:root /home/app/
RUN find /home/app/ -type d -exec chmod 755 {} \;
RUN find /home/app/ -type f -exec chmod 644 {} \;

RUN deluser app rvm

CMD ["/sbin/my_init"]

