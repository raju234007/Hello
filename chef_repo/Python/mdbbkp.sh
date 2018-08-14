#! /bin/bash

HOST="ip-10-0-0-218"
PORT="27017" 
USERNAME=""
PASSWORD=""


BACKUP_PATH="/usr/share/mongodb_backup/" 
TODAYS_DATE=`date "+%Y-%m-%d"`
MONGO_DUMP_BIN_PATH="$(which mongodump)"
TAR_BIN_PATH="$(which tar)"


if [ -d "$BACKUP_PATH" ]; 
	then
	cd $BACKUP_PATH
	
	# initialize temp backup directory
	TMP_BACKUP_DIR="mongodb-$TODAYS_DATE"
	echo; 
	echo "=> Backing up Mongo Server: $HOST:$PORT"; 
	echo -n '   ';
	
	# run dump on mongoDB
	if [ "$USERNAME" != "" -a "$PASSWORD" != "" ]; then 
		$MONGO_DUMP_BIN_PATH --host $HOST:$PORT -u $USERNAME -p $PASSWORD --db question_audit --out $TMP_BACKUP_DIR >> /dev/null
	else 
		$MONGO_DUMP_BIN_PATH --host $HOST:$PORT --db question_audit --out $TMP_BACKUP_DIR >> /dev/null
	fi
	
	# check to see if mongoDb was dumped correctly
	if [ -d "$TMP_BACKUP_DIR" ]; 
		then
	
		# if file name is set to nothing then make it todays date
		if [ "$FILE_NAME" == "" ]; 
			then
			FILE_NAME="$TODAYS_DATE"
		fi
	
		# turn dumped files into a single tar file
		$TAR_BIN_PATH -czf $FILE_NAME.tar.gz $TMP_BACKUP_DIR >> /dev/null

		# verify that the file was created
		if [ -f "$FILE_NAME.tar.gz" ]; 
			then
			echo "=> Success: `du -sh $FILE_NAME.tar.gz`"; 
			echo;
			
			if [ -d "$BACKUP_PATH/$TMP_BACKUP_DIR" ]; 
			then
				rm -rf "$BACKUP_PATH/$TMP_BACKUP_DIR"
			fi
			
			find . ! -name "$FILE_NAME.tar.gz" -type f -exec rm -f {} +
	
		else
			 echo "!!!=> Failed to create backup file: $BACKUP_PATH/$FILE_NAME.tar.gz"; echo;
		fi
	else 
		echo;
		echo "!!!=> Failed to backup mongoDB"; 
		echo;	
	fi
else

	echo "!!!=> Failed to create backup path: $BACKUP_PATH"

fi

sudo aws s3 cp /usr/share/mongodb_backup/ s3://ops-prodlogs/ --recursive >> /dev/null
#sudo aws s3 rm s3://ops-prodlogs/ --recursive --exclude "$FILE_NAME.tar.gz" >> /dev/null


