To create the workspace server for exsting project

Take a dump of existing blueprint db as blueprint_admindev.sql, and import it into db again as blueprint_admindev.
select table core_config_data under db blueprint_admindev 
- blueprint_admindev (db) > core_config_data (table)
login to the db, select db and change the table values for the columns path & value as below

web/unsecure/base_url 		http://xx.xx.xx.xx/blueprint_XX/ to http://xx.xx.xx.xx/blueprint_<developer_name>/
web/unsecure/base_link_url  http://xx.xx.xx.xx/blueprint_XX/ to http://xx.xx.xx.xx/blueprint_<developer_name>/
web/secure/base_url 		http://xx.xx.xx.xx/blueprint_XX/ to http://xx.xx.xx.xx/blueprint_<developer_name>/
web/secure/base_link_url 	http://xx.xx.xx.xx/blueprint_XX/ to http://xx.xx.xx.xx/blueprint_<developer_name>/

Login to the workspace server and go to the /var/www/html/ location.
Copy the project to new folder as below
sudo cp -R blueprint/ blueprint_admindev
Here I created the blueprint project for developer admindev as blueprint_admindev.

Then go to the /etc folder of project as below
/var/www/html/blueprint_admindev/app/etc and edit the env.php file and change the frontName value as below to get the admin url of our project

    'backend' => [
        'frontName' => 'blueprint_admin'
    ]

Then go to the /etc folder of project as below
/var/www/html/blueprint_admindev/app/etc
Edit the env.php file and change the the db name value in db section

    'db' => [
        'table_prefix' => '',
        'connection' => [
            'default' => [
                'host' => 'blueprint.xxxxx.region.rds.amazonaws.com',
                'dbname' => 'blueprint_admindev',
                'username' => 'Username',
                'password' => 'Password',
                'model' => 'mysql4',
                'engine' => 'innodb',
                'initStatements' => 'SET NAMES utf8;',
                'active' => '1'
            ]
        ]
    ]

Run the below commands under root directory to finish the PHP builds in the project
composer install (if not installed)
php -dmemory_limit=6G bin/magento setup:upgrade

php -dmemory_limit=6G bin/magento setup:static-content:deploy en_GB en_US -f
#php bin/magento setup:static-content:deploy (for fresh installation from scratch)
php bin/magento cache:flush

Run the below command to create the admin user for admindev
php bin/magento admin:user:create --admin-user='arthi' --admin-password='247commerce*' --admin-email='arthi@247commerce.co.uk' --admin-firstname='Arthi' --admin-lastname='247commerce'


 
Run the below commands under root directory to finish the PHP builds in the project
composer install (if not installed)
php -dmemory_limit=6G bin/magento setup:upgrade

php -dmemory_limit=6G bin/magento setup:static-content:deploy en_GB en_US -f
#php bin/magento setup:static-content:deploy (for fresh installation from scratch)
php bin/magento cache:flush

Run the below command to create the admin user for admindev
php bin/magento admin:user:create --admin-user='admindev' --admin-password='247commerce*' --admin-email='susant@247commerce.co.uk' --admin-firstname='admindev' --admin-lastname='247Commerce'
2ae709695839f2c6feb6efe1d1750a98907b1247a908bb4db0a62acc022ae83d:IRsIvTdZqhHSQbtk1AlcMN5SCcdnDuYP:1

'host' => 'm2devoutsidevpc.co13c6zl8ys8.eu-west-1.rds.amazonaws.com',
'dbname' => 'db_glyndebourne_dev',
'username' => 'm2devoutsidevpc',
'password' => '247Commerce*123',

sed -i 's/tfl_m2_migrate/magento/g' /home/vagrant/extra/db-dump.sql


max_allowed_packet=1024M

sudo chmod -R 777 /var/www/html/tfl_migrate
sudo chown -R root:root /var/www/html/tfl_migrate

composer install
php -dmemory_limit=6G bin/magento setup:upgrade
php -dmemory_limit=6G bin/magento setup:static-content:deploy en_GB en_US -f
php bin/magento cache:flush

/usr/local/bin/dep deploy dev -vvv

current> composer require dotmailer/dotmailer-magento2-extension:"4.5.0 as 4.1.0"
current> bin/magento setup:upgrade
current> php bin/magento setup:static-content:deploy en_GB en_US -f
current> php bin/magento cache:flush
current> sudo chmod -R 777 var/ pub/ generated/

git remote set-url origin https://github.com/royalschoolofmgt/tfl_media.git


$ cd ~
$ sudo curl -sS https://getcomposer.org/installer | sudo php
$ sudo mv composer.phar /usr/local/bin/composer
$ sudo ln -s /usr/local/bin/composer /usr/bin/composer

then you can run 
$ sudo composer install

php bin/magento setup:di:compile
php bin/magento s:ulp
php bin/magento setup:static-content:deploy -f
php bin/magento module:status Vendorname_Modulename
php bin/magento module:disable Vendorname_Modulename
php bin/magento module:enable Vendorname_Modulename
php bin/magento admin:user:create
php bin/magento indexer:reindex
php bin/magento cache:flush
php bin/magento cache:clean
php bin/magento cache:enable
php -dmemory_limit=6G bin/magento setup:static-content:deploy en_GB en_US -f

sudo service crond stop
/usr/local/bin/dep deploy dev -vvv
cd current
php bin/magento cache:enable
sudo service crond start
cd ../

sudo chmod -R 777 /var/www/html/inandout/
sudo chown -R root:root /var/www/html/inandout/
cd /var/www/html/inandout/
php -dmemory_limit=6G bin/magento setup:upgrade
php -dmemory_limit=6G bin/magento setup:static-content:deploy en_GB en_US -f
php bin/magento cache:flush
sudo chmod -R 777 /var/www/html/inandout/
sudo chown -R root:root /var/www/html/inandout/

sudo wget 99.80.184.198/pub_tfl_sit.zip

sudo chmod -R 777 /var/www/html/tfl_playground/
sudo chown -R ec2-user:apache /var/www/html/tfl_playground/

sudo chmod -R 777 /var/www/html/tfl_sit/
sudo chown -R ec2-user:apache /var/www/html/tfl_sit/

sudo chmod -R 777 /var/www/html/blueprint/
sudo chown -R root:root /var/www/html/blueprint/
cd /var/www/html/blueprint/
composer install
php bin/magento setup:upgrade
php bin/magento setup:static-content:deploy en_GB en_US -f
php bin/magento cache:flush
sudo chmod -R 777 /var/www/html/blueprint/
sudo chown -R root:root /var/www/html/blueprint/

http://192.168.1.31/inandout/


sudo chmod -R 777 /var/www/html/tfl_migrate/
sudo chown -R root:root /var/www/html/tfl_migrate/
cd /var/www/html/tfl_migrate/
php bin/magento setup:upgrade
php bin/magento setup:static-content:deploy en_GB en_US -f
php bin/magento cache:flush
sudo chmod -R 777 /var/www/html/tfl_migrate/
sudo chown -R root:root /var/www/html/tfl_migrate/
