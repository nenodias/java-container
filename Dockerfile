FROM openjdk:8-jdk
EXPOSE 8080
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
ENTRYPOINT ["/usr/local/openjdk-8/bin/java", "-jar", "/usr/share/myservice/myservice.jar"]

# Add Maven dependencies (not shaded into the artifact; Docker-cached)
#ADD target/lib           /usr/share/myservice/lib
# Add the service itself
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/share/myservice/myservice.jar
