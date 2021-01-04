#deployment steps for existing setup
login to bastion machine
login to deployment machine
cd /var/www/html/
cd b2cdev/
run the command: 
/usr/local/bin/dep deploy dev

/usr/local/bin/dep deploy staging

ssh-keygen -t rsa -b 4096 -C "raju@247commerce.co.uk"


#deployer setup 

/var/www/html/Ashmolean
/Ashmolean/
	/shared/  --> craetes new folder with TimeStamp, contets of static files, images, banners, etc
	/deploy.php
	/hosts.yml
	/vendor  --> library folder for deployer
	
	/shared/releases/181220191256 --> /shared/app/pub --> contets of static files, images, banners, etc
	need to create below folders manually
	/shared/app
	/shared/pub
				/media  --> for new customers needs to get from customer, for existing one copy & paste
				/static
	/shared/var
	
	create etc folder for db connection files
	/shared/app/etc
	/shared/app/etc/env.php
	
	
	/hosts.yml
	lolcalhost:
	stage: staging
	local: true
	branch: development
	deploy_path: /var/www/html/Ashmolean
	
generate SSH keys from linux for GitHub
copy this key from linux to GitHub

To do cache remove
/var/www/html/magento2
	php bin/magento indexer:reindex
	php bin/magento c:f

