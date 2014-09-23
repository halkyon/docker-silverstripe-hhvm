FROM ubuntu:trusty
MAINTAINER Sean Harvey <sean@silverstripe.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get -qqy install wget curl
RUN wget --quiet -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN echo deb http://dl.hhvm.com/ubuntu trusty main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get -qq update
RUN apt-get -qqy install mariadb-server nginx hhvm supervisor

RUN /usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60

RUN wget --quiet https://getcomposer.org/composer.phar
RUN chmod +x composer.phar
RUN mv composer.phar /usr/local/bin/composer

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chown root:root /etc/supervisor/conf.d/supervisord.conf
ADD nginx-hhvm.conf /etc/nginx/hhvm.conf
RUN chown root:root /etc/nginx/hhvm.conf

### SILVERSTRIPE START ###

ADD nginx-silverstripe.conf /etc/nginx/silverstripe.conf
RUN chown root:root /etc/nginx/silverstripe.conf
ADD _ss_environment.php /var/_ss_environment.php
RUN chown root:root /var/_ss_environment.php
ADD nginx-default /etc/nginx/sites-available/default
RUN chown root:root /etc/nginx/sites-available/default

### SILVERSTRIPE END ###

EXPOSE 80

CMD ["/usr/bin/supervisord"]
