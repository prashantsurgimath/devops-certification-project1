FROM tomcat:9
MAINTAINER shaik
COPY target/*.war /usr/local/tomcat/webapps/*.war
