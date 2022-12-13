FROM tomcat:9
MAINTAINER shaik-haneef
COPY target/addressbook.war /usr/local/tomcat/webapps/addressbook.war
