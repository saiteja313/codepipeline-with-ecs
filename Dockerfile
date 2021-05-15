# Alpine Linux with OpenJDK JRE
# FROM openjdk:8-jre-alpine
FROM openjdk:11.0.5-jre

RUN mkdir -p /opt/sleepy

COPY ./sleepy.jar /opt/sleepy/

RUN chmod -R o+x /opt/sleepy
RUN apt-get update -y && apt-get install -y curl

ENTRYPOINT ["java", "-cp",  "/opt/sleepy/sleepy.jar", "Sleepy"]