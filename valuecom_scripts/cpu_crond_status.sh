
##### cpu status ######

#!/bin/bash
#Author: Raju
#Purpose: To monitor the CPU usage
	
SUBJECT="WARNING CPU USAGE HIGH"
TO=abc@gmail.com

CPU_USAGE=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); printf "%s%.1f%%\n", prefix, 100 - v }')
DATE=$(date "+%Y-%m-%d %H:%M:")
VALUE=1
##SEND AN EMAIL###
CPU_USAGE="${CPU_USAGE%\%}"
if [[ "$CPU_USAGE" > "$VALUE" ]];
then
	CPU_USAGE="$DATE CPU: $CPU_USAGE"
	MESSAGE="$CPU_USAGE"
	echo $MESSAGE | mail -s "$SUBJECT" "$TO"
fi


##### disable crond ######

#!/bin/bash
crontab -l >> /home/ec2-user/my_cron_"$(date +"%d_%m_%Y")".txt
crontab -r
crontab -l -u ec2-user >> /home/ec2-user/my_cron_"$(date +"%d_%m_%Y")".txt
crontab -r -u ec2-user
sudo /etc/init.d/crond stop

##### To monitor the CPU usage ######

#!/bin/bash
#Author: Raju
#Purpose: To monitor the CPU usage

DATE=$(date "+%Y-%m-%d %H:%M:")
SUBJECT="Disk Space & Free Memory Alert on $DATE"
TO=abc@gmail.com

CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
MEMORY=$(free -g; vmstat; mpstat )
THRESHOLD=10

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
    mail -s "$SUBJECT" "$TO" << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
Memory Utilization as below :
$MEMORY
EOF
fi


##### Stop it NO ONE using the instance ######

#!/bin/bash
#To run for every 5 minutes, add script as below in crontab
#*/5 * * * * /home/ec2-user/apache.sh
Instance_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id/)
SUBJECT="WARNING : $Instance_ID was forgot to SHUTDOWN"
TO=abc@gmail.com

if (( $(last -a | grep -i still | wc -l) > 0 ))
then
echo "someone using the instance!!!"
else
"$(last -a)" >> /home/ec2-user/lastuserinfo.txt
echo "NO ONE using the instance" | mail -s "$SUBJECT" -a /home/ec2-user/lastuserinfo.txt "$TO"
fi
