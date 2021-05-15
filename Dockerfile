# Alpine Linux with OpenJDK JRE
# FROM openjdk:8-jre-alpine
FROM openjdk:11.0.5-jre
workdir /opt/sleepy/
RUN mkdir -p /opt/sleepy && cd /opt/sleepy/

COPY ./Sleepy.java /opt/sleepy/
RUN javac Sleepy.java && jar -cvf sleepy.jar Sleepy.class

RUN chmod -R o+x /opt/sleepy
RUN apt-get update -y && apt-get install -y curl

ENTRYPOINT ["java", "-cp",  "/opt/sleepy/sleepy.jar", "Sleepy"]