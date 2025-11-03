# Use official Java 8 image
FROM openjdk:8-jdk-alpine

# Set working directory
WORKDIR /app

# Copy pom and wrapper first
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

RUN chmod +x mvnw

# Copy everything
COPY . .

# Build
RUN ./mvnw clean package -DskipTests

# Run the JAR
CMD ["java", "-jar", "target/demo-project-0.0.1-SNAPSHOT.jar"]
