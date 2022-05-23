FROM maven:3-adoptopenjdk-8 as sample

WORKDIR /app

COPY . /app

RUN mvn clean package

FROM tomcat:8.0

COPY --from=sample /app/target/*.war /usr/local/tomcat/webapps
