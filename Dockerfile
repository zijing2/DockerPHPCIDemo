From webdevops/php-apache-dev:7.0
MAINTAINER Zijing Huang "hzj_huangzijing@hotmail.com"
RUN git clone https://github.com/zijing2/DockerPHPCIDemo.git /app
WORKDIR /app
RUN composer install
RUN chmod -R 777 /app
EXPOSE 80 3306
