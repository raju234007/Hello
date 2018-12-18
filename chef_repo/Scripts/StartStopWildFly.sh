#! /bin/bash

#Check the status of wildfly
sudo service wildfly status > "/home/ubuntu/wildfly-Status.txt"
status=$( cat /home/ubuntu/wildfly-Status.txt | grep 'Server is running' | cut -d' ' -f5-7 )
if [ "$status" = 'Server is running' ]
	then
	while read -p 'wildfly is running ! Do you want to stop ? [Y | N]' answer
	do
	if [ "$answer" = 'Y' ]
		then
		sudo service wildfly stop
		echo 'wildfly has been stopped'
		
		#removing files from /tmp/data/ ##################################################################
		while read -p 'Do you want to remove files from /tmp/data/ [Y | N]' res
		do
		if [ "$res" = 'Y' ]
			then
			sudo rm -rf /tmp/data/*
			break
			
			elif [ "$res" = 'N' ]
			then
			break
			
			else
			echo 'Please specify Y or N'
			continue
		fi
		done
		
		#removing files from /home/ubuntu/vfs/ ##################################################################
		while read -p 'Do you want to remove files from /home/ubuntu/vfs/ [Y | N]' result
		do
		if [ "$result" = 'Y' ]
			then
			sudo rm -rf /home/ubuntu/vfs/*
			break
			
			elif [ "$result" = 'N' ]
			then
			break
			
			else
			echo 'Please specify Y or N'
			continue
		fi
		done
		
		while read -p 'Do you want to start the wildfly server [Y | N]' response
		do
		if [ "$response" = 'Y' ]
			then
			sudo service wildfly start >> /dev/null
			echo 'wildfly service has been started again . Now you can deploy files'
			break
			
			elif [ "$response" = 'N' ]
			then
			break
			
			else
			echo 'Please specify Y or N'
			continue
		fi
		done
		
		break
		
		elif [ "$answer" = 'N' ]
		then
		break
		
		else
		echo 'Please specify Y or N'
		continue
	fi
	done
else
echo "wildfly service is not running ! You can proceed in other way" 
fi

