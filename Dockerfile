FROM maven:3-adoptopenjdk-8 as maven_builder

WORKDIR /app

COPY . .

RUN mvn clean package

FROM tomcat:8.0

COPY --from=maven_builder /app/target/*.war /usr/local/tomcat/webapps/

