FROM openjdk:8-jdk-alpine
WORKDIR /app

COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline -B || true

COPY src src
RUN ./mvnw clean package -DskipTests

CMD ["java", "-jar", "target/demo-project-0.0.1-SNAPSHOT.jar"]
