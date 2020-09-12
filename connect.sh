a=`aws ec2 describe-instances     --filters "Name=tag:Name,Values=jenkins"    --query Reservations[*].Instances[*].PublicIpAddress     --output text` 
echo $a 
scp -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem jenkins-install.sh ec2-user@$a:/home/ec2-user/
ssh -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem ec2-user@$a sudo yum install  -y dos2unix
ssh -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem ec2-user@$a dos2unix jenkins-install.sh
ssh -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem ec2-user@$a sudo sh jenkins-install.sh
echo $a 
b=`aws ec2 describe-instances     --filters "Name=tag:Name,Values=dev"    --query Reservations[*].Instances[*].PublicIpAddress     --output text`
echo $b
ssh -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem ec2-user@$a sudo yum install  -y docker
ssh -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem ec2-user@$a sudo systemctl start docker
ssh -o StrictHostKeyChecking=no -i /c/Users/abjal/Downloads/abs.pem ec2-user@$a sudo docker swarm init
