# Alpine Linux with OpenJDK JRE
# FROM openjdk:8-jre-alpine
# FROM openjdk:11.0.5-jre
FROM alpine:latest
USER root
WORKDIR /opt/sleepy/

RUN apk update
RUN apk fetch openjdk8
RUN apk add openjdk8 curl
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

RUN java -version
RUN javac -version
RUN mkdir -p /opt/sleepy && cd /opt/sleepy/

COPY ./Sleepy.java /opt/sleepy/
RUN javac Sleepy.java && jar -cvf sleepy.jar Sleepy.class

RUN chmod -R o+x /opt/sleepy

ENTRYPOINT ["java", "-cp",  "/opt/sleepy/sleepy.jar", "Sleepy"]