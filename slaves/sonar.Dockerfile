FROM jenkinsci/jnlp-slave:alpine
MAINTAINER Beni Ben Zikry
USER root
ARG SONAR_SCANNER_VERSION=3.2.0.1227
RUN cd / && wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip &&\
unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip &&\
sed -i '/exec/i \
java_cmd=/usr/lib/jvm/java-1.8-openjdk/jre/bin/java' $(pwd)/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner &&\
 ln -s $(pwd)/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/bin/sonar-scanner &&\
 rm sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
USER jenkins
