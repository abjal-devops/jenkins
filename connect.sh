a=`aws ec2 describe-instances     --filters "Name=tag:Name,Values=jenkins"    --query Reservations[*].Instances[*].PublicIpAddress     --output text` 
echo $a 
scp -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem jenkins-install.sh ec2-user@$a:/home/ec2-user/
ssh -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem ec2-user@$a sudo yum install  -y dos2unix
ssh -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem ec2-user@$a dos2unix jenkins-install.sh
ssh -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem ec2-user@$a sudo sh jenkins-install.sh
sleep 60
ssh -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem ec2-user@$a sudo cat /var/lib/jenkins/initialAdminPassword
 
