#FROM eclipse-temurin:17-jdk-focal

FROM tomcat:10.1-jdk11-openjdk
ADD form-web-ij/target/form1-1.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh","run"]
#ENTRYPOINT ["form1-1.war"]