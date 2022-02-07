FROM redhat/ubi8-minimal

ARG GRAALVM_VERSION=22.0.0.2
ARG MAVEN_VERSION=3.8.4

RUN microdnf update && microdnf install wget tar gzip

RUN wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAALVM_VERSION}/graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz && \
    tar -xzf graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz && \
    mv graalvm-ce-java11-${GRAALVM_VERSION} /opt/graalvm


RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    mv apache-maven-${MAVEN_VERSION} /opt/maven

ENV PATH="/opt/maven/bin:/opt/graalvm/bin:${PATH}"
ENV JAVA_HOME="/opt/graalvm"
