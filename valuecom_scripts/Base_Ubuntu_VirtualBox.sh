**********************************************************************
***                                                                ***
***   OpenSSL has been successfully configured                     ***
***                                                                ***
**********************************************************************

---------------------------------------------
--* Base Image Creation *--
---------------------------------------------


---------------------------------------------
--* Update to OpenSSL 1.1.1d  10 Sep 2019 *--
---------------------------------------------
https://www.howtoforge.com/tutorial/how-to-install-openssl-from-source-on-linux/
## run the whole process as root
mv /usr/bin/openssl /home/dev/usr_bin/
mv /usr/local/openssl /home/dev/usr_local/
yum install gcc
cd /usr/local/src
## OPTIONALLY CHANGE openssl-1.1.1d.tar.gz to the version which you want
wget https://www.openssl.org/source/openssl-1.1.1d.tar.gz
sha256sum openssl-1.1.1d.tar.gz  #confirm this matches the published hash
1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2  openssl-1.1.1d.tar.gz
tar -zxf openssl-1.1.1d.tar.gz
cd /usr/local/src/openssl-1.1.1d
./config --prefix=/usr/local --openssldir=/usr/local/openssl
make
make test
make install
export LD_LIBRARY_PATH=/usr/local/lib64
#make export permanent
echo "export LD_LIBRARY_PATH=/usr/local/lib64" > /etc/profile.d/ld_library_path.sh
chmod ugo+x /etc/profile.d/ld_library_path.sh

Do which openssl to find out which copy you are running - I suspect it's the default, older one.
You'll need to set PATH to contain /usr/local/openssl/bin to get the new one:
export PATH=/usr/local/openssl/bin:$PATH

openssl version  #confirm it works
#recommended reboot here
openssl version  #confirm it works after reboot

------------* DONE *--------------

---------------------------------------------
--* Update to Apache 2.4.41 *--
---------------------------------------------

yum install -y httpd
yum install -y mod24_ssl

yum install httpd-tools
yum install mod_ssl

------------* DONE *--------------

https://devdocs.magento.com/guides/v2.3/install-gde/system-requirements-tech.html
https://www.rosehosting.com/blog/how-to-install-php-7-3-on-ubuntu-16-04/
https://tecadmin.net/install-apache24-php7-on-amazon-linux/
https://fizzbuzzer.com/upgrading-php7-amazon-linux-ec2-instance/
https://stackoverflow.com/questions/53918841/how-to-install-amazon-linux-extras

https://www.rosehosting.com/blog/how-to-install-php-7-2-on-centos-7/
amazon-linux-extras install
amazon-linux-extras install -y php7.2
amazon-linux-extras install -y php7.2-devel 
amazon-linux-extras install -y php7.2-mysql 
amazon-linux-extras install -y php7.2-pdo 
amazon-linux-extras install -y php7.2-mbstring

yum install php72 php72-php php72-php-fpm php72-php-mysqlnd php72-php-mysql php72-php-opcache php72-php-xml php72-php-xmlrpc php72-php-gd php72-php-mbstring php72-php-json php72-php-mcrypt php72-php-pear php72-php-devel php72-php-intl php72-php-bcmath php72-php-cli php72-php-common php72-php-soap php72-php-pecl-zip php72-php-pdo php72-php-process

yum install php7.2 php7.2-php php7.2-php-fpm php7.2-php-mysqlnd php7.2-php-mysql php7.2-php-opcache php7.2-php-xml php7.2-php-xmlrpc php7.2-php-gd php7.2-php-mbstring php7.2-php-json php7.2-php-mcrypt php7.2-php-pear php7.2-php-devel php7.2-php-intl php7.2-php-bcmath php7.2-php-cli php7.2-php-common php7.2-php-soap php7.2-php-pecl-zip php7.2-php-pdo php7.2-php-process

sudo apt-get install php7.2-bz2 php7.2-common php7.2-cgi php7.2-cli php7.2-dba php7.2-dev libphp7.2-embed php7.2-bcmath php7.2-fpm php7.2-gmp php7.2-mysql php7.2-tidy php7.2 php7.2-sqlite3 php7.2-json php7.2-opcache php7.2-sybase php7.2-curl php7.2-ldap php7.2-phpdbg php7.2-imap php7.2-xml php7.2-xsl php7.2-intl php7.2-zip php7.2-odbc php7.2-mbstring php7.2-readline php7.2-gd php7.2-interbase php7.2-snmp php7.2-xmlrpc php7.2-soap php7.2-pspell php7.2-pgsql php7.2-enchant php7.2-recode php7.2-devel php7.2-pecl php7.2-pdo php7.2-process php7.2-pear php7.2-amqplib


sudo systemctl status php72-php-fpm.service
sudo ln -s /usr/bin/php71 /usr/bin/php

sudo systemctl enable php-fpm.service
sudo systemctl status php-fpm.service
sudo systemctl restart php-fpm.service

sudo systemctl enable mysqld.service
sudo systemctl status mysqld.service
sudo systemctl restart mysqld.service

sudo systemctl enable httpd.service
sudo systemctl status httpd.service
sudo systemctl restart httpd.service

https://medium.com/shehuawwal/download-and-run-amazon-linux-2-ami-locally-on-your-virtualbox-or-vmware-b554a98dcb1c
https://www.youtube.com/watch?v=7Aqx-VHv2_k
https://www.dedoimedo.com/computers/amazon-linux-2-login-password.html
https://superuser.com/questions/1048091/can-i-install-ec2-amazon-linux-os-locally-on-virtual-machine
https://mashtips.com/enable-virtualization-windows-10/
https://www.cloudbooklet.com/how-to-install-php-7-3-on-ubuntu-18-04/



1. Install Magento
https://devdocs.magento.com/guides/v2.3/install-gde/composer.html
https://magenticians.com/install-magento-on-aws/
2. Install Composer
https://inchoo.net/magento-2/magento-deployment-deployer/

1. /etc/default/keyboard - change it to US(us)
2. sudo dpkg-reconfigure keyboard-configuration
3. Network should be attached to Bridged Adapter & should not be wireless

Name : Developer
ServerName : magento_dev
user : dev
pswd : dev*247

Optical Drive : .iso file(OS file) #needs to attach to get OS into the Dynamic Drive, after installation it will be removed automatically

amazon-linux-extras install
amazon-linux-extras install -y php7.3 
amazon-linux-extras install -y php7.3-devel 
amazon-linux-extras install -y php7.3-mysql 
amazon-linux-extras install -y php7.3-pdo 
amazon-linux-extras install -y php7.3-mbstring

sudo apt-get install php7.3 php7.3-fpm php7.3-mysql php7.3-opcache php7.3-xml php7.3-xmlrpc php7.3-gd php7.3-mbstring php7.3-json php7.3-mcrypt php7.3-pear php7.3-devel php7.3-intl php7.3-bcmath php7.3-cli php7.3-common php7.3-soap php7.3-pecl-zip php7.3-pdo php7.3-process php7.3-pear php7.3-devel php7.3-amqplib
sudo apt-get install php7.3-common php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-imagick php7.3-cli php7.3-dev php7.3-imap php7.3-mbstring php7.3-opcache php7.3-soap php7.3-zip php7.3-intl -y

sudo apt-get -y install mysql-server-5.7 mysql-client-5.7

sudo mysql_secure_installation
1. root pwd password
2. remove anonymous users: y 
3. root only allowed from localhost: y
4. remove test database and access: n
5. reload privlege table now: y

edited /etc/mysql/mysql.conf.d/mysqld.cnf added line [mysqld] added line #max_allowed_package = 256M (default was 16M)
edited /etc/mysql/mysql.conf.d/mysqld.cnf and change bind-address =  127.0.0.1 to 0.0.0.0
mysql -u root -p
#247commerce
CREATE DATABASE magento;
CREATE USER 'dev'@'%' IDENTIFIED BY 'magento*247';
#ALTER USER 'dev'@'%' IDENTIFIED BY 'Magento*247';
GRANT ALL on *.* to 'dev'@'%';
exit;
CREATE USER 'dev'@'localhost' IDENTIFIED BY 'Magento*247';
GRANT ALL on *.* to 'dev'@'localhost';
exit;
mysql -u magento -p (pwd magento) should get welcome to mysql message
edit /etc/mysql/mysql.conf.d/mysqld.cnf and comment out bind 127.0.0.1
log into mysql as root. CREATE USER 'dev'@'%' IDENTIFIED BY 'password';
GRANT ALL on magento.* to 'dev'@'%';
use the 64 bit installer
Magento 2
Standard TCP/IP
192.168.0.4
3306


Set a new MySQL root password
Run the following command:
use mysql;
update user set authentication_string=PASSWORD("V@luEcom*247") where User='root';
UPDATE mysql.user SET user='root', password=PASSWORD('V@luEcom*247') WHERE user='root';
SET PASSWORD = PASSWORD('V@luEcom*247');
flush privileges;
quit


/*If you use MySQL 5.7.6 and later:*/
ALTER USER 'root'@'%' IDENTIFIED BY 'V@luEcom*247';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'V@luEcom*247';

/*If you use MySQL 5.7.5 and earlier:*/
SET PASSWORD FOR 'root'@'%' = PASSWORD('MyNewPass');

mysql -u root -p
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'EfbmW8u4yCKN9t' WITH GRANT OPTION;

CREATE USER 'dev'@'localhost' IDENTIFIED BY 'V@luEcom*247';
CREATE USER 'dev'@'%' IDENTIFIED BY 'V@luEcom*247';
CREATE USER 'dev'@'%' IDENTIFIED BY 'V@luEcom*247';

CREATE DATABASE jiradb CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
GRANT ALL PRIVILEGES ON *.* to 'dev'@'%' IDENTIFIED BY 'V@luEcom*247' WITH GRANT OPTION;


edit file /etc/apache2/sites-available/000-default.conf
before the </VirtualHost> tag add the following 3 lines  
<Directory "/var/www/html"> 
AllowOverride All 
</Directory>

sudo service php7.3-fpm status

https://192.168.1.61/magento/


php -i | grep "Loaded Configuration File"	 
/etc/php/7.2/cli/php.ini + /etc/php/7.2/apache2/php.ini
date.timezone = "Europe/London"
memory_limit = 3G (was 128M) for cli file and 2G for the apache2 file	
3G needed for cli as magento installation commands are memory hungry may need 4g for main magento install
always_populate_raw_post_data=-1 (found something that said this was depricated in 7.2) asp_tags=off (could not find in the ini and read that removed in php 7.2)	
upload_max_filesize = 256M (was 2M)	
post_max_size = 256M (was 8M)	
edit /etc/php/7.2/apache2/php.ini add the line max_input_vars = 20000	overcomes editing colour_option and getting on save - 
Notice: Undefined offset: 1851 in /var/www/html/magento/vendor/magento/module-swatches/Model/Plugin/EavAttribute.php on line 177. 
NOTE appears to be required after release 2.1.0 but hopefully not required in 2.1.2 need to check as this setting leaves us open to DOS attacks
create a text file in /var/html called php_info.php with the line <?php phpinfo(); ?> 	
in /etc/php/7.2/cli/php.ini change memory_limit = 4G (was 3G)

sudo mkdir composer_temp 
cd composer_temp
sudo curl -sS https://getcomposer.org/installer | sudo php
sudo mv composer.phar /usr/local/bin/composer
only if you had make the change
sudo rmdir /composer_temp


#composer create-project --repository-url=https://repo.magento.com/magento/project-enterprise-edition=2.3.4 /var/www/html/magento


sudo git clone https://github.com/royalschoolofmgt/magento.git

bin/magento setup:install --base-url=http://localhost/magento --db-host=localhost --db-name=magento --db-user=dev --db-password=Magento*247 --admin-firstname=Admin --admin-lastname=247Commerce --admin-email=raju@hotmail.co.uk --admin-user=admin --admin-password=admin*247 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1
[Progress: 985 / 985]
[SUCCESS]: Magento installation complete.
[SUCCESS]: Magento Admin URI: /admin
Nothing to import.

composer install

php -dmemory_limit=6G bin/magento setup:upgrade

php -dmemory_limit=6G bin/magento setup:static-content:deploy en_GB en_US -f

php bin/magento cache:flush


bin/magento setup:install \
--base-url=http://localhost/magento \
--db-host=localhost \
--db-name=magento \
--db-user=dev \
--db-password=Magento*247 \
--admin-firstname=Admin \
--admin-lastname=247Commerce \
--admin-email=raju@hotmail.co.uk \
--admin-user=admin \
--admin-password=admin*247 \
--language=en_US \
--currency=USD \
--timezone=America/Chicago \
--use-rewrites=1

timezone=GMT UTC,  Currency=British Pound, Language=English UK


<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
        <Directory "/var/www/html">
         AllowOverride All
        </Directory>
</VirtualHost>

http://192.168.1.61/

dev ALL=(ALL:ALL)ALL


composer:
username: 'magentoUsernameKey'
password: 'magentoPasswordKey'
Public Key: 3b173853bd2d138a6c56414e69a8aafe
Private Key: c1a28222605d2f9f1e1779a256cc44d4

dism.exe /Online /Disable-Feature:Microsoft-Hyper-V