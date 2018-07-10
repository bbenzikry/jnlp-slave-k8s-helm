FROM jenkinsci/jnlp-slave:alpine
MAINTAINER Beni Ben Zikry

USER root

RUN apk add --update -t deps curl tar gzip ca-certificates git docker &&\
 rm /var/cache/apk/*

USER jenkins
