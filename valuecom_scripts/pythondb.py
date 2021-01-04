import boto3
import smtplib
import os, time, sys
import subprocess
from datetime import datetime
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText

AWS_BUCKET_NAME = 'proform_prod'
AWS_ACCESS_KEY_ID = 'AKIAJZP5HQ6CNUAHTSFA'
AWS_SECRET_ACCESS_KEY = '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'

path = '/usr/share/proform-backup/'
foldername = "{:%d-%m-%Y-%H-%M-%S}".format(datetime.now())

# MAKING DIRECTORY WITH TIMESTAMP
subprocess.Popen("mkdir -p "+path+foldername, shell=True)

#GRANT  ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TABLESPACE, CREATE TEMPORARY TABLES, CREATE USER, CREATE VIEW, EVENT, EXECUTE, FILE, INDEX, INSERT, PROCESS, REFERENCES, RELOAD, REPLICATION CLIENT, REPLICATION SLAVE, SHOW DATABASES, SHOW VIEW, TRIGGER ON  *.* TO 'pf_ops'@'%';
hostip = 'production.cp6rxkjrhpfi.us-east-1.rds.amazonaws.com'
username = 'pf_user'
password = 'ZTeXDyqQ0TMOIrGlXnwfj7'
port = '5123'
dbs = ['accounting','analysis', 'app', 'geodb', 'devex', 'auth', 'simulator']
i_tables = ['fatal_errors','request_traces','errorlogs','errorlogs_history' ]

status = ""
logs = ""

for db in dbs:
    sub = ""

    print "DB: "+db
    
    if(db == "app"):
        print "Filtering"
        ignore_tables = ""
        
        for i_table in i_tables:
            ignore_tables = ignore_tables+"--ignore-table="+db+"."+i_table+" "
        
        sub = subprocess.Popen("mysqldump -h "+hostip+" -P "+port+" -u "+username+" -p"+password+" "+db+" "+ignore_tables+"> "+path+foldername+"/"+db+".sql", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    else:
        print "Executing"
        sub = subprocess.Popen("mysqldump -h "+hostip+" -P "+port+" -u "+username+" -p"+password+" "+db+" > "+path+foldername+"/"+db+".sql", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    output, error_output = sub.communicate()
    
    print "Output : "+output
    print "Error : "+error_output

    if ("error" in error_output):
        status = "error"
        logs = logs+"Failed to take dump ("+error_output+")\n"
        break
    
    print "done: "+db



if (status != "error"):
    # CREATING TAR ZIP FILE
    sub = subprocess.Popen("tar -czvf "+path+foldername+".tar.gz -C "+path+" "+foldername, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    output, error_output = sub.communicate()

    if ("error" in error_output):
        # FAILED TO CREATE TAR ZIP
        logs = logs+"Failed to create TAR ZIP ("+error_output+")\n"
    else:
        # UPLOADING TO S3
        bucket_name = AWS_BUCKET_NAME
        testfile = foldername+".tar.gz"
        s3 = boto3.resource('s3',
         aws_access_key_id=AWS_ACCESS_KEY_ID,
         aws_secret_access_key=AWS_SECRET_ACCESS_KEY)
        s3.meta.client.upload_file(path+testfile, bucket_name, 'rdsdatabase/'+testfile)    
        # s3.meta.client.upload_file(LOCAL PATH FOR FILE, S3_bucket_name, S3 PATH FOR FILE)   

        
subprocess.Popen("rm -R "+path+foldername, shell=True)

now = time.time()

for file in os.listdir(path):
    file = os.path.join(path, file)
    if os.stat(file).st_mtime < now - 7 * 86400:
        if os.path.isfile(file):
            os.remove(os.path.join(path, file))

        
if (status == "error"):
    # FAILED TO TAKE DUMP
    print "Failed"

    fromaddr = "proform-admin@csgsol.com"
    toaddr = "raju.manikala@csgsol.com"
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = "DB Backup Failure Alert"

    body = logs
    msg.attach(MIMEText(body, 'plain'))

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(fromaddr, "trjxyelsfgmrwnhr")
    text = msg.as_string()
    server.sendmail(fromaddr, toaddr, text)
    server.quit()
