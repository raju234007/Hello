------------* Read/Write Access to a Specific Folder *--------------
sudo adduser jai247 --shell=/bin/false --no-create-home

sudo passwd jai247

sudo mkdir -p /var/www/html/ashmolean/
sudo chown -R jai247:jai247 /var/www/html/ashmolean
sudo chown -R root:root /var/www/html
sudo chmod -R 777 /var/www/html

sudo vim /etc/ssh/sshd_config

Match User jai247
	ForceCommand internal-sftp
	PasswordAuthentication yes
	ChrootDirectory /var/www/html/ashmolean
	PermitTunnel no
	AllowAgentForwarding no
	AllowTcpForwarding no
	X11Forwarding no

sudo service sshd restart

------------* Read Only Access to a Specific Folder *--------------
sudo adduser ruser --shell=/bin/false --no-create-home

sudo passwd ruser

sudo chown root:root /var/www/html
sudo chmod 755 /var/www/html

sudo chown ruser:ruser /var/www/html/projectname

sudo vim /etc/ssh/sshd_config

Match User ruser
	ForceCommand internal-sftp
	PasswordAuthentication yes
	ChrootDirectory /var/www/html
	PermitTunnel no
	AllowAgentForwarding no
	AllowTcpForwarding no
	X11Forwarding no

sudo service sshd restart

------------* Read Only Access User *--------------

sudo adduser naveen_read --shell=/bin/false --no-create-home

sudo passwd naveen_read

sudo vim /etc/ssh/sshd_config

Match User naveen_read
	ForceCommand internal-sftp
	PasswordAuthentication yes
	#ChrootDirectory /var/www/html
	PermitTunnel no
	AllowAgentForwarding no
	AllowTcpForwarding no
	X11Forwarding no

sudo service sshd restart

------------* Read/Write Access to a Specific Folder *--------------

sudo adduser raju --shell=/bin/false --no-create-home

sudo chown raju:raju /var/www/html/

sudo vim /etc/ssh/sshd_config

Match User praveen247
	ForceCommand internal-sftp
	Match Group apache
	PasswordAuthentication yes
	ChrootDirectory /var/www/html/tflDev1
	PermitTunnel no
	AllowAgentForwarding no
	AllowTcpForwarding no
	X11Forwarding no

sudo service sshd restart


##################################
sudo adduser praveen247
sudo passwd praveen247 //praveen*987
sudo usermod -aG apache praveen247
sudo usermod --home /var/www/html/tflDev3/ praveen247
sudo chmod -R 777 /var/www/html/tflDev3/
sudo chown -R praveen247:praveen247 /var/www/html/tflDev3
##################################

sudo mkdir -p /var/www/html/myntra/
sudo chmod -R 777 /var/www/html/myntra/

sudo adduser sathish247
sudo passwd sathish247
sudo usermod -aG apache sathish247
sudo usermod --home /var/www/html/myntra/ sathish247
id sathish247

sudo chown -R sathish247:sathish247 /var/www/html/myntra/

sudo vim /etc/ssh/sshd_config

comment the #Subsystem sftp /usr/libexec/openssh/sftp-server
and add internal-sftp in Yanked Line.

Subsystem sftp internal-sftp

Match User sathish247
        ForceCommand internal-sftp
        Match Group apache
        PasswordAuthentication yes
        ChrootDirectory /var/www/html/myntra/
        PermitTunnel no
        AllowAgentForwarding no
        AllowTcpForwarding no
        X11Forwarding no

sudo systemctl restart sshd

##################################

anonymous_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
xferlog_file=/var/log/xferlog
xferlog_std_format=YES

chroot_local_user=YES
listen=YES
listen_ipv6=NO

pasv_addr_resolve=YES
pam_service_name=vsftpd
userlist_enable=NO
tcp_wrappers=YES

pasv_enable=YES
pasv_max_port=13000
pasv_min_port=12000
port_enable=YES

##################################
sudo adduser --shell /bin/false mark247
sudo passwd mark247
sudo usermod -a -G apache mark247
sudo mkdir -p /var/www/html/markaws
sudo mkdir -p /home/mark247/markaws
sudo chown root:root /home/mark247 
sudo chmod 755 /home/mark247
sudo mount --bind /var/www/html/markaws /home/mark247/markaws

sudo chown mark247:apache /home/mark247/markaws
sudo chown mark247:apache /var/www/html/markaws

sudo vim /etc/ssh/sshd_config

comment the #Subsystem sftp /usr/libexec/openssh/sftp-server
and add internal-sftp in Yanked Line.

Match User mark247
ChrootDirectory %h
ForceCommand internal-sftp
PasswordAuthentication yes
AllowAgentForwarding no
AllowTcpForwarding no
X11Forwarding no
PermitTunnel no

####################################

- Create 'kalyan247' and set password:
sudo useradd -c "Test User" -G apache -s /bin/false kalyan247
sudo passwd kalyan247

- Create SFTP directory '/sftp/kalyan247' to which 'kalyan247' will be locked. This directory needs to be owner by 'root:root' as this is requirement from SSH. Also we create a 'kalyan247data' directory to which we will later mound folder we want this user to be able to see:
sudo mkdir -p /sftp/kalyan247/kalyan247data
sudo chown -R root:root /sftp/kalyan247
sudo chmod -R 755 /sftp/kalyan247

- Create directory we want 'kalyan247' to manage and set permissions (you should already have this in place):
sudo mkdir -p /var/www/html/kalyan247data
sudo chmod -R 755 /var/www/html/kalyan247data
sudo chown kalyan247:apache /var/www/html/kalyan247data

- Mount the desired directory to 'kalyan247' chrooted directory:
sudo mount --bind /var/www/html/kalyan247data /sftp/kalyan247/kalyan247data
sudo chown kalyan247:apache /sftp/kalyan247/kalyan247data

- Edit sshd configuration file to enable SFTP chrooted environment:
sudo vim /etc/ssh/sshd_config
----
#Subsystem sftp	/usr/libexec/openssh/sftp-server
Subsystem sftp internal-sftp

Match User kalyan247
ChrootDirectory /sftp/%u
ForceCommand internal-sftp
PasswordAuthentication yes
AllowAgentForwarding no
AllowTcpForwarding no
X11Forwarding no
PermitTunnel no
----
Note: We are using '/sftp/%u' where '%u' is username of the user accessing via SFTP.

- Restart SSH service:
sudo service sshd restart

- To make sure the directory is always mounted to the user chrooted environment we need to add the same to /etc/fstab:
sudo vim /etc/fstab
----
/var/www/html/kalyan247data /sftp/kalyan247/kalyan247data	none default,bind 0 0
----
sudo reboot

sudo chmod 355 deploy.php
sudo chmod 755 deploy.php
#################################
