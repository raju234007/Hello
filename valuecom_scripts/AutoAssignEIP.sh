#!/bin/bash
# Author : Matteo

INSTANCEID=$(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id)
echo "list the instanceID " $INSTANCEID
IPADDRESS=$(aws ec2 describe-addresses --region us-east-1 --filters "Name=tag:instance,Values=not" | grep '"PublicIp"' | tail -n1 | cut -d\" -f 4)
echo "list the all describe free addresses " $IPADDRESS
EIPALLOC=$(aws ec2 describe-addresses --region us-east-1 --filters "Name=public-ip,Values=$IPADDRESS" | grep 'AllocationId' | cut -d\" -f 4)
aws ec2 associate-address --region us-east-1 --instance-id $INSTANCEID  --allocation-id $EIPALLOC
echo "associate-address the free addresse" $EIPALLOC
EIPALLOCGOT=$(aws ec2 describe-addresses --region us-east-1 --filter "Name=instance-id,Values=${INSTANCEID}" | grep 'AllocationId' | cut -d\" -f 4)
echo "list the AllocationId of" $EIPALLOCGOT
aws ec2 create-tags --region us-east-1 --resources $EIPALLOCGOT --tags Key=instance,Value="yes"
echo "tag created for AllocationId of" $IPADDRESS


#!/bin/bash
# Author : Raju
sudo apt install python-pip -y
sudo apt install awscli -y
aws configure set aws_access_key_id xxxxxx
aws configure set aws_secret_access_key xxxxx
aws configure set default.region us-east-1
instance_id=$(ec2metadata --instance-id)
allocation_id=$(aws ec2 describe-addresses --query 'Addresses[?InstanceId==null]' | grep -oP '(?<="AllocationId": ")[^"]*' | head -n 1)
aws ec2 associate-address --instance-id $instance_id --allocation-id $allocation_id


#Scaling up is when you change the instance types within your Auto Scaling Group to a higher type
#(for example: changing an instance from a m4.large to a m4.xlarge), scaling down is to do the reverse.
#Scaling out is when you add more instances to your Auto Scaling Group and scaling in is when you reduce the number of instances in your Auto Scaling Group.
#When you scale out, you distribute your load and risk which in turn provides a more resilient solution, here is an example:
#Let's say you have an ASG with 4x m4.xlarge instances. If one fails that means you lost 25% of your processing capability, it doesn't matter that these are sizeable instances with a good amount of CPU and Ram, the fact is by having bigger instance types but less of them you increase the impact of a failure.
#However if you had say 8x m4.large instead, your total compute is the same as 4x m4.xlarge however if 1 instance dies then you only lose 12.5% of your resources.
#Typically its better to use more smaller instances than less larger ones, so you will see that its more common to "scale-out" to meet demand than it is to "scale-up".
#One last consideration is, in order to scale-up/scale-down you have to restart the instance, so there is a service impact when you scale-up/scale-down. There is no such impact when you scale-in/scale-out however.