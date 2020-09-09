yum install java-1.8.0-openjdk-devel -y
yum install git -y
cd /opt && sudo wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xzvf apache-maven-3.6.3-bin.tar.gz
useradd -d /var/lib/jenkins -s /bin/bash jenkins 
echo 'export PATH=$PATH:/opt/apache-maven-3.6.3/bin' >> /etc/profile
echo 'export M2_HOME=/opt/apache-maven-3.6.3/' >> /etc/profile
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.amzn2.0.1.x86_64/' >> /etc/profile
source /etc/profile
exec bash
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
systemctl start jenkins
systemctl enable jenkins
