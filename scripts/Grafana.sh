


1. create the ec2
--> security group (22 -myip(admin),node-expoter-9100,9090-prometheus ,3000-grafana)

2.login git bash ssh -i pemfile ubuntu-user@publicip
3.switch to root user -> sudo su 

*************DOWNLOAD THE NODE-EXPORTER ********
#!/bin/bash
# INSTALL THE URL 
wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz
# extract that tar file 
 tar -xzf node_exporter-1.2.2.linux-amd64.tar.gz
#rename the file 
mv node_exporter-1.2.2.linux-amd64 monitagent
#switch to monitagent
 cd monitagent 
#insytall the net-tools
 apt install net-tools -y
 #start the nodeexpoter
./node_exporter && nohup ./node_exporter & nohup sh node_exporter &
#check the nodeexpoter
ps -ef | grep -i node "9100"

##INSTALL THE PROMETHEUS
 wget https://github.com/prometheus/prometheus/releases/download/v2.29.1/prometheus-2.29.1.linux-amd64.tar.gz
 #extract that tar file
tar -xzf prometheus-2.29.1.linux-amd64.tar.gz
#rename the file 
mv prometheus-2.29.1.linux-amd64 prometheus
#switch to prometheus
cd prometheus 
#start prometheus
./prometheus & nohup ./prometheus & ./prometheus
#check prometheus
ps -ef | grep -i prometheus "9090"
#switch to prometheus yml file
--> vi prometheus.yml 
#(configure the node keys)
--> netstat -anlp | grep ex:("14913")
### INSTAL THE GRAFANA 
sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
 apt-get update
echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
 sudo apt-get install grafana-enterprise
sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
echo "deb https://packages.grafana.com/enterprise/deb beta main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
#install the grafana
sudo apt-get install grafana
sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
#start the grafana
 systemctl start grafana-server
 #check the grafana
ps -ef | grep grafana
sudo systemctl daemon-reload
#check the status of grafana
sudo systemctl status grafana-server
sudo systemctl start grafana-server


### GRAFANA DASH BOARDS
--> https://grafana.com/grafana/dashboards
--> 













