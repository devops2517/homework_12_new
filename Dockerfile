FROM maven:3.6.3-jdk-8 AS build
WORKDIR /App42PaaS-Java-MySQL-Sample-master
RUN mvn clean
RUN mvn install
RUN mvn package -DskipTests

FROM tomcat:alpine
COPY --from=build /homework_12/App42PaaS-Java-MySQL-Sample/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]