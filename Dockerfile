FROM amazoncorretto:11

ARG JAR_FILE=target/forDocker-*.jar

ENV APP_ID=9988 \
    APP_NAME=ingeniorx

RUN echo "sslverify=false" >> /etc/yum.conf && \
    yum install -y shadow-utils  && \
    yum update -y openssl-libs sqlite pythnon python-libs libnghttp2 && \
    groupadd --gid $APP_ID $APP_NAME && \
    useradd --uid $APP_ID --gid $APP_NAME --shell /bin/bash --create-home $APP_NAME && \
    yum clean all

USER $APP_NAME

COPY ${JAR_FILE} /usr/local/bin/forDocker-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-Xms512M", "-jar", "/usr/local/bin/forDocker-0.0.1-SNAPSHOT.jar"]
