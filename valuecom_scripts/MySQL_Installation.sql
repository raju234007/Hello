sudo grep 'temporary password' /var/log/mysqld.log

## Install MySQL 5.7
sudo apt-get install mysql-server
sudo service mysql restart
mysql -V
mysql  Ver 14.14 Distrib 5.6.44, for Linux (x86_64) using  EditLine wrapper


Set a new MySQL root password
Run the following command:
use mysql;
update user set authentication_string=PASSWORD("V@luEcom*247") where User='root';
UPDATE mysql.user SET user='root', password=PASSWORD('V@luEcom*247') WHERE user='root';
SET PASSWORD = PASSWORD('V@luEcom*247');
flush privileges;
quit


/*If you use MySQL 5.7.6 and later:*/
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';

/*If you use MySQL 5.7.5 and earlier:*/
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('MyNewPass');

mysql -u root -p
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'EfbmW8u4yCKN9t' WITH GRANT OPTION;

CREATE USER 'jira_admin'@'localhost' IDENTIFIED BY 'V@luEcom*247';
CREATE USER 'jira_admin'@'%' IDENTIFIED BY 'V@luEcom*247';

CREATE USER 'confluence_admin'@'localhost' IDENTIFIED BY 'V@luEcom*247';
CREATE USER 'confluence_admin'@'%' IDENTIFIED BY 'V@luEcom*247';

CREATE DATABASE jiradb CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
GRANT ALL PRIVILEGES ON *.* to 'jira_admin'@'%' IDENTIFIED BY 'V@luEcom*247' WITH GRANT OPTION;

CREATE DATABASE confluencedb CHARACTER SET utf8 COLLATE utf8_bin;
GRANT ALL PRIVILEGES ON *.* to 'confluence_admin'@'%' IDENTIFIED BY 'V@luEcom*247' WITH GRANT OPTION;

GRANT ALL ON jiradb.* TO 'jira_admin'@'localhost';
FLUSH PRIVILEGES;
exit;

CREATE USER 'bamboo_admin'@'%' IDENTIFIED BY 'V@luEcom*247';
CREATE DATABASE bamboodb CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
GRANT ALL PRIVILEGES ON *.* to 'bamboo_admin'@'%' IDENTIFIED BY 'V@luEcom*247' WITH GRANT OPTION;

UPDATE mysql.user SET user='wiki_user', password=PASSWORD('P@ssword!123#') WHERE user='test_user';
FLUSH PRIVILEGES;

DROP USER 'jira_admin'@'localhost';
SELECT User,Host FROM mysql.user;

echo "FISHEYE_INST=/opt/atlassian/fecru" | sudo tee -a /etc/environment
source /etc/environment
echo $FISHEYE_INST

ps -ef | grep service
sudo kill -9 process_number

##
/*Create a new database for Magento 2:*/
CREATE DATABASE magento2
Then create a new user name call: db_admin

CREATE USER 'db_admin'@'%' IDENTIFIED BY 'V@luEcom*247';
/*Grant db_admin user to magento2 database:*/

GRANT ALL PRIVILEGES ON *.* to 'db_admin'@'%' IDENTIFIED BY 'V@luEcom*247' WITH GRANT OPTION;
Ok, time to flush privileges and exit.

FLUSH PRIVILEGES;
EXIT;


##
$dbuser='phpmyadmin';
$dbpass='i-0edf139d7b48c6856';
$basepath='';
$dbname='phpmyadmin';
$dbserver='localhost';
$dbport='';
$dbtype='mysql';
~


#If you want to search an entire file, you can use % to indicate that as the range:
:%s/search/replace/g

Dumb:
mysqldump --routines -h m2devoutsidevpc.co13c6zl8ys8.eu-west-1.rds.amazonaws.com -u m2devoutsidevpc -p tfl_staging2 > tfl_jafar.sql
:%s/tfl_staging2/tfl_jafar/g

Restore:
mysql -h m2devoutsidevpc.co13c6zl8ys8.eu-west-1.rds.amazonaws.com -u m2devoutsidevpc -p tfl_jafar < tfl_jafar.sql

https://www.geeksforgeeks.org/tar-command-linux-examples/

mysql -h localhost -u vagrant -p magento < db-dump.sql

mysqldump --routines -h m2devoutsidevpc.co13c6zl8ys8.eu-west-1.rds.amazonaws.com -u m2devoutsidevpc -p tfl_m2_migrate > db_tfl.sql
247Commerce*123


-- MySQL root account password changes --
dev@magento_dev:/etc/apache2$ sudo mysql_secure_installation

Securing the MySQL server deployment.

Connecting to MySQL using a blank password.
The 'validate_password' plugin is installed on the server.
The subsequent steps will run with the existing configuration
of the plugin.
Please set the password for root here.

New password:

Re-enter new password:

Estimated strength of the password: 100
Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : y
By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) : y
Success.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) : y
Success.

By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y
 - Dropping test database...
Success.

 - Removing privileges on test database...
Success.

Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y
Success.

All done!
dev@magento_dev:/etc/apache2$

-- MySQL db update --
user="db_admin"
dbname="magento2"
password="V@luEcom*247"
DATE=$(date "+%Y-%m-%d")

mysql -u $user -D $dbname -p $password -e "update core_config_data set value="http://ip/magento2" where path="web/unsecure/base_url";" > /home/ec2-user/queries/unsecure_$DATE.txt
mysql -u $user -D $dbname -p $password -e "update core_config_data set value="https://ip/magento2" where path="web/secure/base_url";" > /home/ec2-user/queries/secure_$DATE.txt
