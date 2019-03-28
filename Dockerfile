# Dockerfile
FROM 519901771307.dkr.ecr.us-west-2.amazonaws.com/reto:v1

ENV MAVEN_VERSION 3.3.9

RUN mkdir -p /usr/share/maven \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

VOLUME /root/.m2

COPY target/yoodle-5.0.0.jar /home/yoodle-5.0.0.jar
CMD ["mvn"] 
CMD ["java","-jar","/home/java-maven-junit-helloworld-2.0-SNAPSHOT.jar"]
