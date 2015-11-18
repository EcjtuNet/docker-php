FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update -y
RUN apt-get install -y nginx php5-fpm php5-mysqlnd php5-cli mysql-server supervisor curl php5-curl

RUN sed -e 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf
RUN sed -e 's/upload_max_filesize = 2M/upload_max_filesize = 32M/' -i /etc/php5/fpm/php.ini
RUN sed -e 's/;listen\.owner/listen.owner/' -i /etc/php5/fpm/pool.d/www.conf
RUN sed -e 's/;listen\.group/listen.group/' -i /etc/php5/fpm/pool.d/www.conf
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN rm -rf /var/lib/mysql
RUN rm /etc/mysql/conf.d/mysqld_safe_syslog.cnf

RUN php5 --version && mysql --version

ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD mysql_init.sh /mysql_init.sh
ADD vhost.conf /etc/nginx/sites-available/default
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD init.sh /init.sh
RUN chmod 755 /*.sh

EXPOSE 80

CMD ["/usr/bin/supervisord"]
