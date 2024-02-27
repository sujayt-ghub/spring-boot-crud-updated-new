# Spring-Boot-Crud

[Youtube Link](https://youtu.be/3cVZQiL3Alk)


Youtube Channel Link : [Click here](https://www.youtube.com/channel/UCJyDMA1hY0gWrCylFD963DA)

https://www.youtube.com/watch?v=pIPji3_rYPY link to deploy spring boot app in minikube k8s with database connection

reference https://linux.how2shout.com/steps-to-install-openjdk-17-ubuntu-linux-such-as-22-04-or-20-04/

Steps to Install Openjdk 17 ubuntu Linux such as 22.04 or 20.04
sudo apt update
sudo apt install openjdk-17-jdk
java --version
sudo update-alternatives --config java  #To configure the default Java version, use the command

sudo apt install maven
mvn --version

--------------------------------------------
How to Install IntelliJ IDEA on Ubuntu 22.04 #reference https://linuxhint.com/install-intellij-idea-on-ubuntu-20-04/
sudo apt update
sudo apt install vim apt-transport-https curl wget software-properties-common
sudo add-apt-repository ppa:mmk2410/intellij-idea -y
sudo add-apt-repository ppa:mmk2410/intellij-idea -y
sudo apt install intellij-idea-community -y # launch the intelliJ
export ideaJ=/opt/intellij-idea-community/bin/idea.sh
${ideaJ} & to run intelliJ in background



--------------------------------------------------
reference for mysql install on ubuntu,  https://www.youtube.com/watch?v=zRfI79BHf3k
sudo apt update
sudo apt install mysql-server -y
sudo systemctl status mysql.service
sudo systemctl start mysql.service
sudo mysql_secure_installation # will ask for new root user password at 1st time once install done
type pwd as root
type n for all promts , type y only for Reload privilege tables now # later success message will promt
mysql -u root -p # to enter mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'; # line to change root pwd

create database spring_crud_demo;
use spring_crud_demo;
show tables;
desc student;
select * from student;


-------------------------------------

working with postman
download postnam from official site
select the link with Linux x64
wget https://dl.pstmn.io/download/latest/linux_64

referenc to extaract https://linuxize.com/post/how-to-unzip-gz-file/

example command : tar -xf archive.tar.gz

tar -xf linux_64

extracted to folder Postman
cd Postman/ # app and Postman files
./Postman & # lauch postman in background

create new HTTP request
select post and select url http://localhost:8080/student/add
under select body -> raw->click text and select json
wrte below message

{
    "name":"ArjunCodes",
    "address":"Nepal"
}

run the srpingbootapp in intelliJ

click on send in postman to the add the student
check in mysql- select * from student;


now get metheod

select get and select url http://localhost:8080/student/getAll
click on send in postman
to see list of student



# spring-boot-crud-updated



minikube start
ls
cd Spring-boot-crud/

sudo bim db-deployment.yaml
sudo vim db-deployment.yaml
eval $(minikube docker-env)
ls

sudo snap install mysql-workbench-community
src
ls
cd main/
ls
cd resources/
ls
sudo vim application.properties
export DB_HOST=localhost
export DB_NAME=javatechie
export DB_USERNAME=root
export DB_PASSWORD=root
kubectl get pods
kubectl apply -f db-deployment.yaml
kubectl port-forward mysql-5b544b4797-hcbj9 <local-port>:<container-port>
kubectl port-forward mysql-5b544b4797-hcbj9 3306:3306
kubectl port-forward mysql-5b544b4797-hcbj9 3306:3306 &
# mysql port forward references https://stackoverflow.com/questions/74420726/cant-connect-to-mysql-service-on-kuberenetes-through-workbench
kubectl get svc
sudo snap remove mysql-workbench-community
sudo snap install mysql-workbench-community
use javatechie; #run use database command to read database details
kubectl get pods

kubectl exec -it mysql-5b544b4797-hcbj9 /bin/bash
mysql -h mysql -u root -p
  
cd Spring-boot-crud
rm -rf target
mvn clean install
cd target/  # check if jar file successfully created
cd ..
cat Dockerfile
cd target/
mv springboot-crud-0.0.1-SNAPSHOT.jar springboot-crud-k8s.jar # renaming jar file to match with name in Dockerfile

# remove unwanted images 
cd ..
docker images
docker rmi openjdk
docker rmi openjdk:8
docker rmi -f 115053965e86
docker rmi -f 178031df919b
docker images
kubectl get pods
ls
sudo vim Dockerfile
ls
sudo vim Dockerfile
check the openjdk version , may get issue or errors if build version does't matches
#docker openjdk image references https://stackoverflow.com/questions/69525199/openjdk-java-17-docker-image
docker build -t springboot-crud-k8s:1.0 .
docker images
ls
cd target/
ls
java -jar springboot-crud-k8s.jar (manual run to check if working ?)
cd ..
ls
sudo vim app-deployment.yaml
kubectl apply -f app-deployment.yaml
kubectl get pods
kubectl get svc
ls
cd
ls
cd Postman/
ls
./Postman & # run posting to to add or get records for the app
ls
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




----------------------------

feb 22 notes

https://www.youtube.com/watch?v=RR_oMDp4kEc Docker Container for Node.Js Application with MySQL Database

sudo snap install mysql-workbench-community to install mysql workbench in ubuntu

https://www.youtube.com/watch?v=PAQvxqocb6A Docker spring boot MySQL example | Spring boot MySQL docker


docker run -d -p 3306:3306 --name mysqldb -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=javatechie mysql



 docker run -p 8080:8080 --name app -e DB_HOST=localhost -e DB_NAME=javatechie -e DB_USERNAME=root -e DB_PASSWORD=root app

https://www.youtube.com/watch?v=PAQvxqocb6A worked connection b/w docker srpingapp and mysqldb


1026  docker network ls
 1027  docker network
 1028  docker network create spring-net
 1029  docker ps
 1030  docker network connect spring-net mysqldb
 1031  docker ps
 1032  docker ps -a
 1033  docker run -p 8080:8080 --name app --net spring-net -e DB_HOST=localhost -e DB_NAME=javatechie -e DB_USERNAME=root -e DB_PASSWORD=root app
 1034  ls
 1035  docker ps -a
 1036  docker rm -f app
 1037  docker ps -a
 1038  docker run -p 8080:8080 --name app --net spring-net -e DB_HOST=mysqldb -e DB_NAME=javatechie -e DB_USERNAME=root -e DB_PASSWORD=root app
 1039  history


docker run -p 8080:8080 --name app --net spring-net app
--------------------------------------------------------------------------
feb 22

issue with mvn clean package 
run below commands , prior check mysql container running
export DB_HOST=localhost
export DB_NAME=javatechie
export DB_USERNAME=root
export DB_PASSWORD=root
mvn clean package
echo $DB_HOST

create package manual running below command
mvn clean package or mvn clean install or mvn -B -DskipTests clean package

cat Dockerfile  1
FROM openjdk:17-oracle
ENV DB_HOST=mysqldb
ENV DB_NAME=javatechie
ENV DB_USERNAME=root
ENV DB_PASSWORD=root
EXPOSE 8080
ADD target/springboot*.jar springboot-crud-k8s.jar
ENTRYPOINT ["java","-jar","/springboot-crud-k8s.jar"]

edited
cat Dockerfile 2
FROM openjdk:17-oracle
EXPOSE 8080
ADD target/springboot*.jar springboot-crud-k8s.jar
ENTRYPOINT ["java","-jar","/springboot-crud-k8s.jar"]



run below command from the project folder
docker build -t app .
docker ps -a
docker run -p 8080:8080 --name app --net spring-net app
docker run -p 8080:8080 --name app --net spring-net app or docker run -p 8080:8080 --name app --net spring-net -e DB_HOST=mysqldb -e DB_NAME=javatechie -e DB_USERNAME=root -e DB_PASSWORD=root app
based on availability of env data in docker file either of above command to be run
check if app started 

docker exec -it ca64b306f6ac bash ## exec specific conatiner
------------------------------------------------------------------




FEB 27

https://devopscube.com/run-docker-in-docker/ docker inside docker
https://medium.com/@shivam77kushwah/docker-inside-docker-e0483c51cc2c docker inside docker
https://kodekloud.com/blog/run-docker-in-docker-container/ docker inside docker

method 1 docker inside docker - creating with own image

sudo vim Dockerfile
FROM ubuntu:latest
RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy curl && \
    apt-get install -qy curl && \
    curl -sSL https://get.docker.com/ | sh


docker build -t test-image .
sudo chmod 666 /var/run/docker.sock

docker run -v /var/run/docker.sock:/var/run/docker.sock -ti test-image:latest direct run
docker run -d -v /var/run/docker.sock:/var/run/docker.sock -ti test-image:latest run in detach mode

docker run -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -ti test-image:latest 
to execute with 8080 port
docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -ti test-image:latest
to execute with port 8080 in detach mode



docker exec -it 6357c8d1c2e9 /bin/sh or docker exec -it 6357c8d1c2e9 bash

----------------------------------

method 2 docker inside docker - Using DinD

Step 1: Create a container named dind-test with docker:dind image
docker run --privileged -d --name dind-test docker:dind
Step 2: Log in to the container using exec.
docker exec -it dind-test /bin/sh



-----------------------

to use mysql container inside docker inside docker container
java and maven installed to build jar app ,
will get jdbc error if we try to build jar app without proper mysql set up 

ls
java --version
apt update
sudo apt install openjdk-17-jdk
apt install sudo
sudo apt install openjdk-17-jdk
java -version
apt install maven -y
ls
mkdir springboot
cd springboot/
git clone https://github.com/sujayt-ghub/spring-boot-crud-updated.git
cd spring-boot-crud-updated/
mvn clean package
sudo apt update
sudo apt install mysql-server -y
sudo systemctl start mysql.service
apt install systemctl
sudo systemctl start mysql.service
systemctl status mysql.service
issue when installing mysql inside container, hence alternatively used docker mysql image
docker images
docker run -d -p 3306:3306 --name mysqldb -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=javatechie mysql

docker start 665e1c2dd8b9 start container
docker ps
ls
mvn clean install
export DB_HOST=192.168.0.121  # there was issue with localhost as hostname as am using docker mysql images, after replacing with host ip , issue resolved
export DB_NAME=javatechie
export DB_USERNAME=root
export DB_PASSWORD=root

rm -rf target/

mvn clean install
can able to  build jar file
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



-------------



FROM ubuntu:latest

ENV DB_HOST=192.168.0.121
ENV DB_NAME=javatechie
ENV DB_USERNAME=root
ENV DB_PASSWORD=root

RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy curl && \
    apt-get install -qy curl && \
    curl -sSL https://get.docker.com/ | sh
RUN apt install openjdk-17-jdk -y && apt install maven -y
WORKDIR demo
COPY . .
RUN mvn clean install
COPY --from=build target/*.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]

---------------


cat Dockerfile
FROM ubuntu:latest

ENV DB_HOST=192.168.0.121
ENV DB_NAME=javatechie
ENV DB_USERNAME=root
ENV DB_PASSWORD=root

RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy curl && \
    apt-get install -qy curl && \
    curl -sSL https://get.docker.com/ | sh
RUN apt install openjdk-17-jdk -y && apt install maven -y
WORKDIR demo
COPY . .
RUN mvn clean install
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "./target/*.jar"]


Successfully built 7a6d6612c41b
Successfully tagged test-image:latest


docker run -p 8080:8080 --name testapp -e DB_HOST=192.168.0.121 -e DB_NAME=javatechie -e DB_USERNAME=root -e DB_PASSWORD=root test-image:latest

-------------------------

cat Dockerfile
FROM ubuntu:latest AS build

ENV DB_HOST=192.168.0.121
ENV DB_NAME=javatechie
ENV DB_USERNAME=root
ENV DB_PASSWORD=root

RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy curl && \
    apt-get install -qy curl && \
    curl -sSL https://get.docker.com/ | sh
RUN apt install openjdk-17-jdk -y && apt install maven -y
COPY . .
RUN mvn clean install

FROM openjdk:17-oracle
WORKDIR demo
EXPOSE 8080
COPY --from=build target/*.jar demo.jar
ENTRYPOINT ["java", "-jar", "demo.jar"]

success complete

docker run -p 8080:8080 --name testapp -e DB_HOST=192.168.0.121 -e DB_NAME=javatechie -e DB_USERNAME=root -e DB_PASSWORD=root test-image:latest






---------------------------------
