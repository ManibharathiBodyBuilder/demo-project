# Use official Java 8 image
FROM openjdk:8-jdk-alpine

# Set working directory
WORKDIR /app

# Copy only pom.xml and mvnw first
COPY pom.xml .
COPY mvnw .
# Copy .mvn folder only if it exists
COPY .mvn .mvn

# Give permission to mvnw
RUN chmod +x mvnw

# Download dependencies (optional but helps caching)
RUN ./mvnw dependency:go-offline -B || true

# Copy all source code
COPY src src

# Build the project
RUN ./mvnw clean package -DskipTests

# Run the Spring Boot jar
CMD ["java", "-jar", "target/demo-project-0.0.1-SNAPSHOT.jar"]
