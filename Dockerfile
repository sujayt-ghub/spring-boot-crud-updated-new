FROM openjdk:17-oracle
EXPOSE 8080
ADD tarrget/springboot*.jar springboot-crud-k8s.jar
ENTRYPOINT ["java","-jar","/springboot-crud-k8s.jar"]
