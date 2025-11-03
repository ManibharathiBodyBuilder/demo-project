# Use official Java 8 image
FROM openjdk:8-jdk-alpine

# Set working directory
WORKDIR /app

# Copy pom and wrapper
COPY mvnw .
COPY pom.xml .

RUN chmod +x mvnw

# Copy source files
COPY . .

# Build the project
RUN ./mvnw clean package -DskipTests

# Run the jar
CMD ["java", "-jar", "target/demo-project-0.0.1-SNAPSHOT.jar"]
