FROM ubuntu:15.10

MAINTAINER Kateryna Shlyakhovetska <shkate@jetbrains.com>

RUN apt-get update && apt-get install -y -q curl unzip \
    && apt-get clean all

COPY /dir/4c238894 /usr/lib/jvm/oracle-jdk

ENV JRE_HOME=/usr/lib/jvm/oracle-jdk/jre
RUN update-alternatives --install /usr/bin/java java ${JRE_HOME}/bin/java 1 \
     && update-alternatives --set java ${JRE_HOME}/bin/java \
     && update-alternatives --install /usr/bin/javac javac ${JRE_HOME}/../bin/javac 1 \
     && update-alternatives --set javac ${JRE_HOME}/../bin/javac

CMD ["java" "-version"]
