FROM tomcat:9
MAINTAINER shaik-h
COPY target/addressbook.war /usr/local/tomcat/webapps/addressbook.war
