#!/bin/bash
cd /opt/
wget https://download.sonatype.com/nexus/3/nexus-3.37.3-02-unix.tar.gz
# exteact the tarfile
tar -xvzf nexus-3.37.3-02-unix.tar.gz
#rename that tar file
mv nexus-3.37.3-02 nexus
cd /opt/nexus/bin
adduser nexus
passwd nexus
visudo
nexus ALL=(ALL) NOPASSWD: ALL
#exit that  cd /opt/nexus/bin
cd ../..
#change the permission nexus & sonartype
chown -R nexus:nexus nexus
chown -R nexus:nexus sonatype-work
cd /opt/nexus/bin/

vi nexus.rc
-------------
run_as_user="nexus"

cd ..
cd etc/

vi /etc/systemd/system/nexus.service
----------------------
[Unit]
Description=nexus service
After=network.target
  
[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
TimeoutSec=600
  
[Install]
WantedBy=multi-user.target


#install java
yum update -y
yum install -y java-1.8.0-openjdk-devel.x86_64
#check java version
java -version
#enable nexus
systemctl enable nexus
#start nexus
systemctl start nexus
#start nexus
systemctl status nexus
#check the browser
browser : <nexus_publicip>:8081


signin
-------
admin
cat /opt/sonatype-work/nexus3/admin.password

disable anonymous access
