FROM eclipse-temurin:17-jdk

LABEL author="johan"

LABEL company="Metrodata" website="https://www.johanwork.com"

ARG JAR_FILE=target/*.jar

COPY ${JAR_FILE} movieservice.jar

ENTRYPOINT ["java", "-jar", "/movieservice.jar"]

EXPOSE 8080