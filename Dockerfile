FROM openjdk:17-oracle
ENV DB_HOST=mysqldb
ENV DB_NAME=javatechie
ENV DB_USERNAME=root
ENV DB_PASSWORD=root
EXPOSE 8080
ADD target/springboot*.jar springboot-crud-k8s.jar
ENTRYPOINT ["java","-jar","/springboot-crud-k8s.jar"]
