FROM tomcat:9
MAINTAINER shaik-Haneef
COPY target/addressbook.war /usr/local/tomcat/webapps/addressbook.war
