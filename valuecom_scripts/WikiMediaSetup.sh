#############################
#!/bin/bash
# Author : Raju
#curl -s 'http://checkip.amazonaws.com'
#curl icanhazip.com
#############################
new_ip = $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
#old_ip = $(curl http://169.254.169.254/latest/meta-data/public-ipv4)

file="/home/ec2-user/old_ip.txt" #the file where you keep your string name

old_ip=$(cat "$file")

echo $new_ip
echo $old_ip

if [ "$new_ip" = "$old_ip" ]
then
sudo service mysqld restart
sudo service php-fpm-7.1 restart
sudo service nginx restart
elif [ "$new_ip" != "$old_ip" ]
then
sed -i 's/'$old_ip'/'$new_ip'/' $file
echo Updating new ip.
else
echo Something not working.
fi
#<--MagentoSetup-->#

#############################
#!/bin/bash
# Author : Raju
#curl -s 'http://checkip.amazonaws.com'
#curl icanhazip.com
#############################
new_ip=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
file="/home/ec2-user/old_ip.txt" #the file where you keep your string name
phpfile="/usr/share/nginx/html/mediawiki/LocalSettings.php"
old_ip=$(cat "$file")

echo Started executing

if [ "$new_ip" = "$old_ip" ]
then
sudo service mysqld restart
sudo service php-fpm-7.1 restart
sudo service nginx restart
elif [ "$new_ip" != "$old_ip" ]
then
sed -i s/"$old_ip"/"$new_ip"/g $phpfile
echo Updating new ip.
sudo service mysqld restart
sudo service php-fpm-7.1 restart
sudo service nginx restart
sed -i s/"$old_ip"/"$new_ip"/g $file
else
echo Something not working.
fi


#https://www.tecmint.com/auto-execute-linux-scripts-during-reboot-or-startup/
# add script in the /etc/rc.local location as below
# bash /etc/init.d/mymediawikistartup.sh
#<--Upadted MagentoSetup-->#

#############################
#!/bin/bash
# Author : Raju
#curl -s 'http://checkip.amazonaws.com'
#curl icanhazip.com
#############################
new_ip=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
IPfile="/home/ec2-user/magento_script_logs/old_ip.txt" #the file where you keep your string name
envphpfile="/var/www/html/magento2/app/etc/env.php"
old_ip=$(cat "$IPfile")
user="db_admin"
dbname="magento2"
password="V@luEcom*247"
DATE=$(date "+%Y-%m-%d")

echo Started executing

if [ "$new_ip" = "$old_ip" ]
then
sudo service mysqld restart
sudo service php-fpm restart
sudo service httpd restart
elif [ "$new_ip" != "$old_ip" ]
then
sed -i s/"$old_ip"/"$new_ip"/g $envphpfile
curl -s $new_ip/magento2/magento_base_url_ip.php?ip=$new_ip
echo Clearing cache...
sudo rm -rf /var/www/html/magento2/var/cache/
echo Restarting Magento2 Services...
sudo service mysqld restart
sudo service php-fpm restart
sudo service httpd restart
echo Updating new ip...
sed -i s/"$old_ip"/"$new_ip"/g $IPfile
else
echo Something NOT Working.
fi

#https://www.tecmint.com/auto-execute-linux-scripts-during-reboot-or-startup/
# add script in the /etc/rc.local location as below
# bash /etc/init.d/UpdateMagentoIP.sh


##Set a crontab for this
#crontab -e
@reboot  /home/user/test.sh

-- create a Symlink
#In the file you put in /etc/init.d/ you have to set it executable with:
chmod +x /etc/init.d/start_my_app

#Thanks to @meetamit, if this does not run you have to create a symlink to /etc/rc.d/
ln -s /etc/init.d/start_my_app /etc/rc.d/

-- Add in Boot Sequence
#Try using this command to ensure your script is added to the boot sequence:
sudo update-rc.d /etc/init.d/nameofscript.sh defaults

#Note that you can make a script executable using the +x option with chmod:
chmod +x /etc/init.d/nameofscript.sh

--If you use centos or rhel 7 you need to activate one service extra.
chmod u+x /etc/rc.d/rc.local
systemctl start rc-local
systemctl enable rc-local
#<--Upadte MagentoIP-->#