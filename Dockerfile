FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y sudo apache2 curl wget
RUN apt-get install -y php7.0 libapache2-mod-php7.0 libapache2-mod-php php7.0-mysql php7.0-gd

RUN echo "mysql-server mysql-server/root_password password bug" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password bug" | debconf-set-selections

RUN apt-get update && \
	apt-get -y install mysql-server mysql-client && \
	mkdir -p /var/lib/mysql && \
	mkdir -p /var/run/mysqld && \
	mkdir -p /var/log/mysql && \
	chown -R mysql:mysql /var/lib/mysql && \
	chown -R mysql:mysql /var/run/mysqld && \
	chown -R mysql:mysql /var/log/mysql


# UTF-8 and bind-address
RUN sed -i -e "$ a [client]\n\n[mysql]\n\n[mysqld]"  /etc/mysql/my.cnf && \
	sed -i -e "s/\(\[client\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf && \
	sed -i -e "s/\(\[mysql\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf && \
	sed -i -e "s/\(\[mysqld\]\)/\1\ninit_connect='SET NAMES utf8'\ncharacter-set-server = utf8\ncollation-server=utf8_unicode_ci\nbind-address = 0.0.0.0/g" /etc/mysql/my.cnf


ENV LOG_STDOUT **Boolean**
ENV LOG_STDERR **Boolean**
ENV LOG_LEVEL warn
ENV ALLOW_OVERRIDE All
ENV DATE_TIMEZONE UTC
ENV TERM dumb

COPY run-lamp.sh /usr/sbin/

RUN a2enmod rewrite && \
    chmod +x /usr/sbin/run-lamp.sh && \
    chown -R www-data:www-data /var/www/html



#FROM ubuntu:14.04

#MAINTAINER nora

ADD sources.list /etc/apt/

#RUN apt-get -y update
#RUN apt-get -y install php5 php5-mysqlnd mysql-server wget unzip curl supervisor

#RUN /etc/init.d/mysql start &&\
#    mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by 'bug';"&&\
#    mysql -u root -pbug -e "show databases;"

WORKDIR /var/www/html/

COPY ./bwapp.conf /etc/supervisor/conf.d/bwapp.conf
#COPY ./startup.sh /var/www/html
COPY ./bWAPP_latest /var/www/html
#RUN chmod 777 -R /var/www/html/startup.sh
#RUN apt-get -y install unzip

#RUN wget http://jaist.dl.sourceforge.net/project/bwapp/bWAPP/bWAPP_latest.zip && unzip bWAPP_latest.zip &&\
#    rm /var/www/html/index.html

RUN chmod 777 -R /var/www/html



VOLUME /var/www/html
VOLUME /var/log/httpd
VOLUME /var/lib/mysql
VOLUME /var/log/mysql

EXPOSE 80
CMD ["/usr/sbin/run-lamp.sh"]
#RUN /etc/init.d/mysql restart && /etc/init.d/apache2 restart &&\
#RUN  curl http://127.0.0.1/bWAPP/install.php?install=yes 1>/dev/null

#EXPOSE 80

#CMD ["/var/www/html/startup.sh"]