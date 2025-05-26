FROM amazonlinux:2
RUN yum install java tar gzip -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.105/bin/apache-tomcat-9.0.105.tar.gz /opt/tomcat
RUN tar -xvzf apache-tomcat-9.0.105.tar.gz && \
    mv apache-tomcat-9.0.105/* /opt/tomcat && \
    rm -rf apache-tomcat-9.0.105 apache-tomcat-9.0.105.tar.gz
EXPOSE 8080
COPY ./WebApp.war /opt/tomcat/webapps 
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
