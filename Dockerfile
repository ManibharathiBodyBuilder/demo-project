# Use an official Java 8 runtime as a base image
FROM openjdk:8-jdk-alpine

# Set working directory inside container
WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml ./
RUN ./mvnw dependency:go-offline -B

# Copy the source code
COPY src ./src

# Package the application
RUN ./mvnw package -DskipTests -B

# Expose Spring Boot default port
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "target/demo-project-0.0.1-SNAPSHOT.jar"]
