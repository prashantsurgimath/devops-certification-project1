FROM tomcat:9
MAINTAINER shaik
COPY target/addressbook.war /usr/local/tomcat/webapps/addressbook.war