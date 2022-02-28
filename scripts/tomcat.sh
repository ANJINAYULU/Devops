#!/bin/bash
#Download the java
cd /tmp
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
#install the java
rpm -ivh jdk-8u131-linux-x64.rpm
#delete the rpm after java installatin 
rm -f jdk-8u131-linux-x64.rpm
#install the tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58-windows-x64.zip
# unzip the file
unzip apache-tomcat-9.0.58-windows-x64.zip
#rename the file
mv apache-tomcat-9.0.58 tomcat
#change the permission
chmod -R 700 tomcat
#change the directory
 cd tomcat
 #switch to bin 
cd bin
#start the tomcat
./startup.sh
#check the tomcat
8. ps -ef | grep -i tomcat