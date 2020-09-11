yum install java-1.8.0-openjdk-devel -y
yum install git -y
cd /opt && sudo wget https://archive.apache.org/dist/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz
tar -xzvf apache-maven-3.6.2-bin.tar.gz
echo 'export PATH=$PATH:/opt/apache-maven-3.6.2/bin' >> /root/.bashrc
echo 'export M2_HOME=/opt/apache-maven-3.6.2/' >> /root/.bashrc
source /root/.bashrc
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
git clone https://github.com/abjal-devops/jenkins.git
cp ~/jenkins/plugins/* /var/lib/jenkins/plugins && cp ~/jenkins/plugins1/* /var/lib/jenkins/plugins && cp ~/jenkins/config.xml /var/lib/jenkins/
systemctl start jenkins
systemctl enable jenkins
sudo chown -R jenkins.jenkins /opt/apache-maven-3.6.2/
yum install docker -y
systemctl start docker 
usermod -aG docker jenkins # restart of jenkins required.
systemctl restart jenkins
