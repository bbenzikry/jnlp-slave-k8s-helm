FROM jenkinsci/jnlp-slave:alpine
MAINTAINER Beni Ben Zikry

ENV HELM_VERSION v2.8.1
ENV HELM_FILENAME helm-${HELM_VERSION}-linux-amd64.tar.gz

# Change this to your appropriate kube version
ENV KUBE_LATEST_VERSION="v1.8.4"

USER root
WORKDIR /
RUN apk add --update -t deps curl tar gzip ca-certificates git

RUN curl -L https://kubernetes-helm.storage.googleapis.com/helm-canary-linux-amd64.tar.gz | tar zxv -C /tmp \
  && cp /tmp/linux-amd64/helm /usr/local/bin/helm \
  && chmod +x /usr/local/bin/helm

# Install img
COPY ./installers/img.sh .
RUN chmod +x ./img.sh && ./img.sh && rm img.sh

# Install kubectl + dotnet core
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl && \
 curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin

RUN apk del --purge deps \
 && rm /var/cache/apk/*

USER jenkins
RUN helm init --client-only
