FROM jenkinsci/jnlp-slave:alpine
MAINTAINER Kerkhoff Technologies Inc. <linuxsupport@kerkhofftech.ca>

ENV HELM_VERSION v2.8.1
ENV HELM_FILENAME helm-${HELM_VERSION}-linux-amd64.tar.gz
ENV KUBE_LATEST_VERSION="v1.8.4"

USER root
WORKDIR /
RUN apk add --update -t deps curl tar gzip ca-certificates git nodejs-npm
RUN curl -L https://kubernetes-helm.storage.googleapis.com/helm-canary-linux-amd64.tar.gz | tar zxv -C /tmp \
  && cp /tmp/linux-amd64/helm /usr/local/bin/helm \
  && chmod +x /usr/local/bin/helm

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl

USER jenkins
RUN helm init --client-only

