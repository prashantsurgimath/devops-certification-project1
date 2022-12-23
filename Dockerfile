FROM tomcat:9
MAINTAINER rahul
COPY target/addressbook.war /usr/local/tomcat/webapps/addressbook.war
