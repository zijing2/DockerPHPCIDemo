From webdevops/php-apache-dev:7.0
MAINTAINER Zijing Huang "hzj_huangzijing@hotmail.com"
RUN rm -fr /var/www/html && git clone https://github.com/zijing2/DockerPHPCIDemo.git /var/www/html
EXPOSE 80 3306
