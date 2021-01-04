<VirtualHost *:80>
    # This first-listed virtual host is also the default for *:80
    ServerName rajumanikala.esy.es
    ServerAlias rajumanikala.esy.es 
    DocumentRoot "/var/www"
</VirtualHost>

telnet rajumanikala.esy.es 80

sudo apt-get install openjdk-8-jdk


#!/bin/bash
apt install python-pip -y
apt install awscli -y
aws configure set aws_access_key_id 
aws configure set aws_secret_access_key 
aws configure set default.region us-east-1
aws s3 mb s3://rajuvalue247
aws s3 ls BUCKET --recursive | sort | tail -n 1 | cut -d ' ' -f1,2


export AWS_ACCESS_KEY_ID = 
export AWS_SECRET_ACCESS_KEY = 
export AWS_DEFAULT_REGION = 

aws autoscaling put-lifecycle-hook --lifecycle-hook-name AttachEIP --auto-scaling-group-name Test_ASG --lifecycle-transition autoscaling:EC2_INSTANCE_LAUNCHING --notification-target-arn arn:aws:sns:us-east-1:876653333959:SendMailToMe --role-arn arn:aws:iam::876653333959:role/AutoScalingNotification
https://aws.amazon.com/premiumsupport/knowledge-center/attach-second-eni-auto-scaling/
https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html#sns-notifications
https://blog.cloudthat.com/auto-attach-elastic-ip-to-ec2-classic-instance-for-autoscaling/
https://medium.com/financial-engines-techblog/aws-lambdas-with-a-static-outgoing-ip-5174a1e70245
https://www.shellhacks.com/docker-run-image-as-container/
http://collabnix.com/installing-helm-to-deploy-kubernetes-applications-on-docker-enterprise-2-0-made-easy/

sudo apt-get update
sudo apt-get install ruby
sudo apt-get install git
sudo gem install svn2git
sudo apt-get install git-svn
sudo apt-get install subversion

svn log --quiet http://svn.247commerce.com:81/svn/PHP/trunk/xml2mysql | grep -E "r[0-9]+ \| .+ \|" | awk '{print $3}' | sort | uniq

svn log -q http://svn.247commerce.com:81/svn/PHP/ | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > /home/ubuntu/authors.txt

https://www.dontpanicblog.co.uk/2013/05/23/migrating-from-svn-to-git/

sed -i 's/54.162.26.120/3.87.50.47/g' input.txt

svn2git http://svn.247commerce.com:81/svn/PHP/trunk/xml2mysql --authors /home/ubuntu/authors.txt

https://github.com/royalschoolofmgt/xml2mysql.git

git svn clone --stdlayout --authors-file=/home/ubuntu/authors.txt https://github.com/royalschoolofmgt/xml2mysql.git

https://devopscube.com/mount-ebs-volume-ec2-instance/
git svn clone http://svn.247commerce.com:81/svn/PHP/trunk/xml2mysql --no-metadata -A /home/ubuntu/authors.txt --stdlayout /home/ubuntu

git svn clone http://svn.247commerce.com:81/svn/PHP/ --branches=branches/*
git svn clone -s http://svn.247commerce.com:81/svn/PHP/ /home/ubuntu/Git_repo
script as 
a=get new IP from host
b=get old IP from saved File
sed -i 's/a/b/g' input.txt
restart services
update File with new IP

--log-window-size=9999999999999

brew reinstall subversion --with-perl

svn2git http://svn.247commerce.com:81/svn/PHP/branches/247commerce -revision r1:r5

svn checkout http://svn.247commerce.com:81/svn/PHP/ /home/ubuntu/svn_checkout

svnadmin create /home/ubuntu/repos/svn

svnadmin load /home/ubuntu/repos/svn < /home/ubuntu/svngit.dump

@reboot /etc/init.d/mymediawikistartup.sh

ln -s /etc/init.d/mymediawikistartup.sh /etc/rc.d/

mkdir /home/ubuntu/$(date +%M)

git svn clone file:///home/ubuntu/repos/svn /home/ubuntu/repos/git -A authors.txt -t tags -b branches -T trunk

git svn clone file://svn_checkout git_checkout –no-metadata -A authors.txt -t tags -b branches -T trunk
svnadmin load /var/www/svn < /home/ubuntu/svngit.dump

git remote set-url origin git@github.com:royalschoolofmgt/svncheckoutcode.git
git remote add origin git@github.com:royalschoolofmgt/new-bare-svn2git.git

git svn clone file://$(pwd)/svn_checkout git_checkout/ --no-metadata -A authors.txt --stdlayout

svn info http://svn.247commerce.com:81/svn/PHP/

http://www.lowlevelmanager.com/2011/06/migrate-svn-repositorydump-to-git.html
https://john.albin.net/git/convert-subversion-to-git

https://stackoverflow.com/questions/45925060/how-to-update-openssl-on-ubuntu-from-openssl-1-0-1f-to-openssl-1-0-2g

/usr/local/bin/dep deploy dev

git config user.email "raju@247commerce.co.uk"

https://whatismyipaddress.com/ip/
http://www.akamaras.com/linux/linux-script-to-check-if-a-service-is-running-and-start-it-if-its-stopped/

EfbmW8u4yCKN9t

mysql -u admin -p -h nttest.cehkgqhjzsgo.eu-west-1.rds.amazonaws.com

mysql -u admin -p -h nttest.cehkgqhjzsgo.eu-west-1.rds.amazonaws.com magento_bookshop < magento_bookshop.sql

*/5 * * * * /home/ec2-user/cloudwatch_logs/aws-scripts-mon/mon-put-instance-data.pl --mem-used-incl-cache-buff --mem-util --mem-used --mem-avail --disk-space-util --disk-space-avail --disk-path=/ --from-cron
*/5 * * * * ~/.aws-scripts-mon/mon-put-instance-data.pl --aws-credential-file="/home/ec2-user/.aws-scripts-mon/credentials.conf" --mem-used-incl-cache-buff --mem-util --mem-used --mem-avail --swap-util --swap-used --disk-space-util --disk-space-used --disk-space-avail --disk-path=/ --from-cron
*/5 * * * * ~/.aws-scripts-mon/mon-put-instance-data.pl --aws-credential-file="/home/ec2-user/.aws-scripts-mon/credentials.conf" --mem-used-incl-cache-buff --mem-util --mem-used --mem-avail --swap-util --swap-used --disk-space-util --disk-space-used --disk-space-avail --disk-path=/ --verify --verbose
select count(*) from information_schema.TABLES where TABLE_SCHEMA = 'magento_bookshop'; 
https://www.devopsindia.in/cloudwatch-custom-metrics-for-memory-and-disk/
https://medium.com/faun/deploy-a-php-application-on-ec2-with-github-and-aws-codepipeline-fb38cf204cbb

https://www.netsparker.com/blog/web-security/disable-directory-listing-web-servers/

sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-14ef74df.efs.eu-west-1.amazonaws.com:/ /home/ec2-user/efs
fs-14ef74df.efs.eu-west-1.amazonaws.com:/ /home/ec2-user/efs nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0

############## # Crontab # ##############
crontab -l > my_cron_"$(date +"%d_%m_%Y")".txt
Then you can empty it:

crontab -r
To restore:

crontab my_cron_backup.txt
crontab -l

sudo /etc/init.d/crond stop



https://medium.com/@andtrott/how-to-downsize-a-root-ebs-volume-on-aws-ec2-amazon-linux-727c00148f61
https://codingbee.net/rhcsa/rhcsa-creating-partitions


* * * * * /usr/bin/wget "34.247.156.21" --timeout 30 -O - 2>/dev/null  | grep "Normal operation string" || echo "The site is down" | /usr/bin/mail -v -s "Site is down" your@e-mail.address

#To create 12GB file
sudo fallocate -l 13G 13GBfile

#To make 100% CPUUtilization
yes > /dev/null &
killall yes


https://medium.com/@primaadipradana/stress-test-cpu-and-memory-in-linux-d17bfa5e8887
for i in `seq 1 10000000`; do true; done
sudo grep 'temporary password' /var/log/mysqld.log


View single commit:
https://github.com/<user>/<project>/commit/<hash>
View log:
https://github.com/<user>/<project>/commits/<hash>
View full repo:
https://github.com/<user>/<project>/tree/<hash>
<hash> can be any length as long as it is unique.
https://github.com/royalschoolofmgt/inandout/commit/a5fb37f4


Usage Instructions for v1.5 Mage 2.3.3
Launch CloudFormation Stack, and wait for 15 whole minutes!
Important! Please review the aMiSTACX full admin HTML/PDF guide for your stack.
1. https://Your_AWS_IP_Address:8080/magento_2.3.3_amistacx_g3_s3t_guide_v1.5/magento_2.3.3_amistacx_g3_s3t_guide_v1.5.html
2. SSH ubuntus home directory
/home/ubuntu/
magento_2.3.3_amistacx_mse_g3

$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
ec2-metadata -i
find -type f -exec du -Sh {} + | sort -rh | head -n 5

SELECT table_schema "phillipstoys_pawan",
        ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB" 
FROM information_schema.tables 
GROUP BY table_schema;

find -type f -exec du -Sh {} + | sort -rh | head -n 5



#Get most recent files in a directory on Linux
ls -Artls | tail -n 5

sudo rsync -avr backup_src/ astonmartin/backup_dst/`date +%Y-%m-%d-%T`

username="raju247commerce"
password="Raju*247"
git push "https://$username:$password@github.com/royalschoolofmgt/astonmartin.git"

git config --global user.name "pawan70701"
git config --global user.email "pawan70701@247commerce.co.uk"
git config --global credential.helper credential-store
git config --global credential.helper 'cache --timeout 86400'

git log --author="prabhu247commerce"  --pretty=tformat: --numstat | awk '{inserted+=$1; deleted+=$2; delta+=$1-$2; ratio=deleted/inserted} END {printf "Commit stats:\n- Lines added (total)....  %s\n- Lines deleted (total)..  %s\n- Total lines (delta)....  %s\n- Add./Del. ratio (1:n)..  1 : %s\n", inserted, deleted, delta, ratio }' -
git shortlog -sn --author="prabhu247commerce\|vilas247" --no-merges --since="1 Sep, 2019"
git log --author="prabhu247commerce" --stat
git log --author="prabhu247commerce"
git log --author="prabhu247commerce" --oneline
git log --pretty="%cn committed %h on %cd"
git log --graph --decorate --oneline --author="vilas247" --pretty="%cn committed %h "%s" on %cd"
https://medium.com/the-andela-way/exploring-the-git-log-command-9117b9ff3c2c
https://git-scm.com/docs/pretty-formats
git log --graph --decorate --oneline
git log --author="prabhu247commerce" --pretty="%cn committed %h "%s" on %cd"
ghe-repo owner/247CommerceStaticDesign -c "less audit_log"
Office Professional Plus 2016
PWG4W-XPNHQ-8GBVQ-RJC9J-RX83V

#added script here

#!/bin/sh
git add -u .;
git add -A .;
git commit -m "generated files on `date +'%Y-%m-%d %H:%M:%S'`";
#git push origin rsync
username="raju"
password="password"
git push "https://$username:$password@github.com/royalschoolofmgt/astonmartin.git"

#added below lines in crontab
*/1 * * * * sudo rsync -avr /home/ec2-user/backup_src/ /home/ec2-user/astonmartin/backup_dst/
*/1 * * * * cd /home/ec2-user/astonmartin/ && sudo bash git_rsync.sh >> /home/ec2-user/git_rsync.log


cd /var/www/html/glyn_hitesh_pg/glyndebourne
#!/bin/sh
git add -u .;
git add -A .;
git commit -m "generated files on `date +'%Y-%m-%d %H:%M:%S'`";
#git push origin rsync
username="pawan70701"
password="Pawan@123!"
git push "https://$username:$password@github.com/royalschoolofmgt/glyndebourne.git"


*/1 * * * * cd /var/www/html/blueprint_pawan/ && sudo bash pgsync.sh >> /home/ec2-user/git_pawan.log



sudo adduser phillipstoys_pawan
sudo passwd phillipstoys_pawan
sudo usermod -a -G apache phillipstoys_pawan
sudo usermod --home /var/www/html/phillipstoys_pawan/ phillipstoys_pawan
sudo chmod -R 777 /var/www/html/phillipstoys_pawan
sudo chown -R phillipstoys_pawan:apache /var/www/html/phillipstoys_pawan

*/1 * * * * git clone --branch phillips_pawan_pgsync https://pawan70701:Pawan%40123%21@github.com/royalschoolofmgt/phillipstoys.git /var/www/html/phillipstoys_pawan


cd /var/www/html/phillipstoys_pawan/
#!/bin/sh
git add -u .;
git add -A .;
git commit -m "generated files on `date +'%Y-%m-%d %H:%M:%S'`";
#git push origin rsync
git push "https://pawan70701:Pawan%40123%21@github.com/royalschoolofmgt/phillipstoys.git"


*/1 * * * * cd /var/www/html/phillipstoys_pawan/ && sudo bash pgsync.sh >> /home/ec2-user/phillipstoys_pawan.log


sudo cp blueprint_siva_old/app/etc/env.php blueprint_siva/app/etc/
sudo cp blueprint_neelesh/.gitignore blueprint_siva/
cd blueprint_siva/
sudo vim pgsync.sh
sudo chmod u+x pgsync.sh




#!/bin/sh
echo "config username"
git config --global user.name "pawan70701"
echo "config useremail"
git config --global user.email "pawan@247commerce.co.uk"
echo "config credential store"
git config credential.helper store
echo "config credential timeout"
git config --global credential.helper 'cache --timeout 86400'
echo "add to staging"
git add -u .;
git add -A .;
echo "exclude file git_pawan.sh"
git reset -- git_pawan.sh
echo "commit code"
git commit -m "generated files on `date +'%Y-%m-%d %H:%M:%S'`";
username="pawan70701"
password="Pawan%40123!"
echo "pushing code"
echo $username
echo $password
git push "https://$username:$password@github.com/royalschoolofmgt/glyndebourne.git"

http://99.80.184.198/ssgb_upgraded/


sudo mkdir -p backups cache composer_home log page_cache report session view_preprocessed

ssh-rsa <Public-Lines: 6> linux_dev_2020

blueprint_jafar

sudo adduser blueprint_neelesh
sudo passwd blueprint_neelesh
sudo usermod -a -G apache blueprint_neelesh
sudo usermod --home /var/www/html/blueprint_neelesh/ blueprint_neelesh
sudo chmod -R 777 /var/www/html/blueprint_neelesh
sudo chown -R blueprint_neelesh:apache /var/www/html/blueprint_neelesh

allow_writeable_chroot=YES

du -a /var/www/html | sort -n -r | head -n 5
sed -i 's/oldstr/newstr/g' db-dump.sql
sed -i 's/tfl_migrate_sit/tfl_migrate_api/g' tfl_migrate_api.sql


#If you want to search an entire file, you can use % to indicate that as the range:
:%s/search/replace/g

Dump:
mysqldump --routines -h m2devoutsidevpc.co13c6zl8ys8.eu-west-1.rds.amazonaws.com -u m2devoutsidevpc -p tfl_migrate_sit > db_tfl.sql
:%s/tfl_migrate_sit/tfl_jafar/g

Restore:
mysql -h m2devoutsidevpc.co13c6zl8ys8.eu-west-1.rds.amazonaws.com -u m2devoutsidevpc -p tfl_migrate_api < tfl_migrate_api.sql

https://www.geeksforgeeks.org/tar-command-linux-examples/

mysql -h localhost -u vagrant -p magento < db-dump.sql

mysqldump --routines -h m2devoutsidevpc.co13c6zl8ys8.eu-west-1.rds.amazonaws.com -u m2devoutsidevpc -p tfl_m2_migrate > db_tfl.sql
247Commerce*123


#import in local VM
Dump:
mysqldump --routines -h m2devoutsidevpc.co13c6zl8ys8.eu-west-1.rds.amazonaws.com -u m2devoutsidevpc -p tfl_migrate_sit > db_tfl.sql
:%s/tfl_migrate_sit/db_tfl/g

Restore:
mysql -h localhost -u dev < db_tfl.sql


sudo kill `sudo lsof -t -i:8090`
start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" http://52.18.76.216/innout_neelesh


## How to mount EBS volume into EC2 Ubuntu Instance ##
First see if it is attached with:

>> sudo fdisk -l
Disk /dev/xvdb: 10.7 GB, 10737418240 bytes

Then format it (if you haven't already done it)
>> sudo mkfs -t ext4 /dev/xvdb

Create dir where it will be mounted:
>>mkdir /xvdb1

That's it you can mount it:
>>sudo mount /dev/xvdb /xvdb1

Check if it has been mounted correctly with:
>>mount -l
/dev/xvdb on /xvdb1 type ext4 (rw)

Make it to mount automatically on system start
>>sudo vim  /etc/fstab

and add this:
/dev/xvdb       /xvdb11   auto    defaults,nobootwait     0       0

Done
umount /dev/xvdb1

https://maplpro.blogspot.com/
## How to mount EBS volume into EC2 Ubuntu Instance ##