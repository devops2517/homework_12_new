FROM maven:3.6.3-jdk-8 AS build
ADD /home/dev/homework_12_new /App42PaaS-Java-MySQL-Sample-master
WORKDIR /App42PaaS-Java-MySQL-Sample-master
RUN mvn clean -Xe
RUN mvn install
RUN mvn package -DskipTests

FROM tomcat:alpine
COPY --from=build /App42PaaS-Java-MySQL-Sample-master/App42PaaS-Java-MySQL-Sample/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
