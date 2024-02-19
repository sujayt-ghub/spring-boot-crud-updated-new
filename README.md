# Spring-Boot-Crud

[Youtube Link](https://youtu.be/3cVZQiL3Alk)


Youtube Channel Link : [Click here](https://www.youtube.com/channel/UCJyDMA1hY0gWrCylFD963DA)

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
