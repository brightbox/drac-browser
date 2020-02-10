FROM ubuntu@sha256:8d31dad0c58f552e890d68bbfb735588b6b820a46e459672d96e585871acc110

ENV SHELL /bin/bash

RUN apt-get update && apt-get install -y firefox openjdk-8-jdk:amd64 openjdk-8-jdk-headless:amd64 icedtea-8-plugin:amd64 icedtea-netx

RUN ln -sfn /usr/lib/jvm/java-8-openjdk-amd64 /usr/lib/jvm/default-java

RUN sed -i 's/^jdk.jar.disabledAlgorithms=.*/jdk.jar.disabledAlgorithms=MD2, RSA keySize < 1024, DSA keySize < 1024/' /etc/java-8-openjdk/security/java.security
RUN sed -i 's/^jdk.tls.disabledAlgorithms=.*/jdk.tls.disabledAlgorithms=RC4, DES, MD5withRSA, DH keySize < 1024, EC keySize < 224/' /etc/java-8-openjdk/security/java.security
RUN sed -i 's/^.*EC keySize < 224, 3DES_EDE_CBC, anon, NULL//' /etc/java-8-openjdk/security/java.security
