#!/bin/bash
# install the java
sudo apt-get install openjdk-11-jdk wget apt-transport-https curl gnupg2 -y
#check the java version
java -version
# Install and Configure Elasticsearch on Ubuntu
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch --no-check-certificate | sudo apt-key add -
#Next add the repository 
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
#update the package
sudo apt-get update -y
#Install elasticsearch on Ubuntu ec2
sudo apt-get install elasticsearch -y
#go to the path: /etc/elasticsearch/elasticsearch.yml

#start the elacticsearch service
 sudo systemctl start elasticsearch
#To enable elacticsearch at system startup
 sudo systemctl enable elasticsearch
#To check the status of elasticsearch
sudo systemctl status elasticsearch
#To restart elasticsearch service
 sudo systemctl restart elasticsearch
 #check the package
ps -ef | grep -i elasticsearch
#install the nettools
apt install net-tools -y
#Enter below command to check elasticsearch is running by sending HTTP request:
 curl -X GET "0.0.0.0:9200"
#Install and Configure Logstash on Ubuntu
sudo apt-get install logstash
#To load logstash beat create the below config file and insert below lines
sudo vi /etc/logstash/conf.d/02-beats-input.conf
input {
beats {
port => 5044
}
}
:wq!
#To start logstash service
sudo systemctl start logstash
#start the logstash
sudo systemctl status logstash
#enable the logstash
sudo systemctl enable logstash
#restart the logstash
sudo systemctl restart logstash


#Install and Configure Kibana on Ubuntu
sudo apt-get install kibana
#sudo vi /etc/kibana/kibana.yml
#To start kibana service
sudo systemctl start kibana
# enable kibana service
sudo systemctl enable kibana
# check the kibana status
sudo systemctl status kibana
#restart the kibana 
sudo systemctl restart kibana




