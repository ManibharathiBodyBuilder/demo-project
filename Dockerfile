FROM openjdk:8-jdk-alpine
WORKDIR /app

COPY pom.xml .
COPY mvnw .
RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline -B || true
