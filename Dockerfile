# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk-jammy

#RUN chmod u+x /bin/sh
#RUN chmod u+x /mvnw

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod u+x ./mvnw
RUN ./mvnw dependency:resolve

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]