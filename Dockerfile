FROM anapsix/alpine-java
LABEL maintainer="labs@cyberark.com"
COPY /home/ubuntu/workspace/spring-project/target/ /home/
CMD ["java","-jar","/home/spring-petclinic-*.jar"]
