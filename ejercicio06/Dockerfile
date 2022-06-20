FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift:1.12-1.1655301789

ADD passwordapi.jar /usr/src/passwordapi/

WORKDIR /usr/src/passwordapi

EXPOSE 8080

CMD ["java", "-jar", "passwordapi.jar"]
