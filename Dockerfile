FROM anapsix/alpine-java
LABEL maintainer="labs@cyberark.com"
COPY /home/ubuntu/workspace/spring-project/target/spring-petclinic-*.jar /home/spring-petclinic-*.jar
CMD ["java","-jar","/home/spring-petclinic-*.jar"]
