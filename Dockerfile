FROM maven:3.6.1-jdk-8 as maven_builder

ENV appdata /opt/javaapp/

RUN mkdir -p "$appdata"

WORKDIR $appdata

COPY . $appdata

RUN mvn package



