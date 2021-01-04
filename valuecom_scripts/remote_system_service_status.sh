
########## remote service status #############
#!/bin/bash
service=httpd
host=54.80.169.199
SUBJECT="WARNING : $service was stopped at `date`"
TO=raju237007@gmail.com

if echo "GET; exit" | nc -v $host 80 > /dev/null 2>&1
then
echo "$service is running"
else
echo "$service is not running on $host" | mail -s "$SUBJECT" "$TO"
fi


well if you use telnet command to check the port connectivity, it will show

"connection timeout" if the port is blocked by the firewall
"Connection refused" if the service is down/not listening on specified port, but port is reachable.
"connected to server_ip" if connection is successful

telnet myserver.com 80 
nc -v myserver.com 80
nmap myserver.com 80 

To run for every 5 minutes
*/5 * * * * /home/ec2-user/apache.sh


########## remote service conf #############
/*
Instructions:
------------
Create a file under  /etc/init.d/ with nano or vi and paste the example script below.
EX. sudo vi /etc/init.d/service

Modify the SERVICE_NAME, PATH_TO_JAR, and choose a PID_PATH_NAME for the file you are going to use to store your service ID.

Copy the script here

Write the file and give execution permisions
EX. sudo chmod +x /etc/init.d/service

run the below commands
sudo update-rc.d service defaults
sudo systemctl enable service

Test that it runs EX. sudo service service start
Test that it stops EX. sudo service service stop
Test that it restarts EX. sudo service service restart
*/

#!/bin/sh
#
### BEGIN INIT INFO
# Provides:          service
# Required-Start:    $remote_fs
# Required-Stop:     $remote_fs
# Should-Start:      $syslog $network $named $time
# Should-Stop:       $syslog $network $named $time
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Controls service logs
# Description:       Controls service logs
### END INIT INFO

###
SERVICE_NAME=service
PATH_TO_JAR=/home/ubuntu/service.jar
PID_PATH_NAME=/tmp/service-pid
case $1 in
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ ! -f $PID_PATH_NAME ]; then
            nohup java -jar $PATH_TO_JAR >>/var/log/service.log 2>> /dev/null >> /dev/null &
            echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is already running ..."
        fi
    ;;
    stop)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stoping ..."
            kill $PID;
            echo "$SERVICE_NAME stopped ..."
            rm $PID_PATH_NAME
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
	status)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME running ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
    restart)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stopping ...";
            kill $PID;
            echo "$SERVICE_NAME stopped ...";
            rm $PID_PATH_NAME
            echo "$SERVICE_NAME starting ..."
            nohup java -jar $PATH_TO_JAR >>/var/log/service.log 2>> /dev/null >> /dev/null &
            echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac 


########## remote service status #############

#!/bin/bash
#Author: Raju
#Purpose: This script will check status of Apache/MySQL/etc
#if that service is not running it will start the service and send an email to you. If the restart does not work, it sends an email and then exits

#set the path ##this works for Ubuntu 14.04 and 16.04 also
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#set your email address 
EMAIL="abc@gmail.com"

#list your services you want to check
SERVICES=( 'httpd' )

#### OK. STOP EDITING ####


 for i in "${SERVICES[@]}"
  do
 ###CHECK SERVICE####
 `pgrep $i >/dev/null 2>&1`
 STATS=$(echo $?)

 ###IF SERVICE IS NOT RUNNING####
 if [[  $STATS == 1  ]]

  then
  ##TRY TO RESTART THAT SERVICE###
  sudo service $i restart

  ##CHECK IF RESTART WORKED###
  `pgrep $i >/dev/null 2>&1`
  RESTART=$(echo $?)

  if [[  $RESTART == 0  ]]
   ##IF SERVICE HAS BEEN RESTARTED###
   then

    ##REMOVE THE TMP FILE IF EXISTS###
    if [ -f "/tmp/$i" ]; 
    then
     rm /tmp/$i
    fi

    ##SEND AN EMAIL###
    MESSAGE="$i was down, but I was able to restart on $(hostname) at $(date)  "
    SUBJECT="$i was down but I restarted on $(hostname) at $(date) "
    echo $MESSAGE | mail -s "$SUBJECT" "$EMAIL"

   else
    ##IF RESTART DID NOT WORK###

    ##CHECK IF THERE IS NOT A TMP FILE###
    if [ ! -f "/tmp/$i" ]; then

     ##CREATE A TMP FILE###
     touch /tmp/$i

     ##SEND A DIFFERENT EMAIL###
     MESSAGE="$i is down on $(hostname) at $(date)  "
     SUBJECT=" $i  down on $(hostname) at $(date) "
     echo $MESSAGE  " I tried to restart it, but it did not work"  | mail -s "$SUBJECT" "$EMAIL"
    fi
  fi
 fi

  done
exit 0;


########## Ubuntu system service #############

#!/bin/sh
#
### BEGIN INIT INFO
# Provides:          service_name
# Required-Start:    $remote_fs
# Required-Stop:     $remote_fs
# Should-Start:      $syslog $network $named $time
# Should-Stop:       $syslog $network $named $time
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Controls service_name logs
# Description:       Controls service_name logs
### END INIT INFO

###
SERVICE_NAME=service_name
PATH_TO_JAR=/home/ubuntu/service_name.jar
PID_PATH_NAME=/tmp/service_name-pid
case $1 in
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ ! -f $PID_PATH_NAME ]; then
            nohup java -jar $PATH_TO_JAR >>/var/log/service_name.log 2>> /dev/null >> /dev/null &
            echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is already running ..."
        fi
    ;;
    stop)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stoping ..."
            kill $PID;
            echo "$SERVICE_NAME stopped ..."
            rm $PID_PATH_NAME
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
	status)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME running ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
    restart)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stopping ...";
            kill $PID;
            echo "$SERVICE_NAME stopped ...";
            rm $PID_PATH_NAME
            echo "$SERVICE_NAME starting ..."
            nohup java -jar $PATH_TO_JAR >>/var/log/service_name.log 2>> /dev/null >> /dev/null &
            echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac 
