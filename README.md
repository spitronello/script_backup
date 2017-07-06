Odoo backup script

This script is for generate backups and filestore backups of a odoo data base

 
 USE METHOD

 1- Clone git repositore with: git clone https://github.com/bisnesmart/scripts_backup.git in the /home 

 2- Create directory: sudo mkdir backup.

 3- In pg_backup.config, BACKUP_DIR="" is necesary to write the name of the directory we want to keep the backups. 

 	example:"BACKUP_DIR=/home/user/backup/"

 4- Change the permission: chmod -R 777 /home/user/backup/

 5- Now go to /etc and use vim or nano to open crontab, in this directory we need to create a cron-time-lapse to run the backups


 	59 23 * * * root sudo su postgres /home/user/scripts_backup/pg_backup_rotated.sh


 	59= minutes
 	23= hours
 	*= fixed day (of the month)
 	*= week day
 	*= 
 	root= user
 	configuration= The function we are going to activate in the programated time-lapse. In the example we are going to run our backup_script


 	This Cron will create a backup every day al 23:59 hours.

 6- Once the crontab is ready we restart de cron service:

 	sudo service cron restart.


 Use of filestore.sh

 	1.This script keep all the attached files in odoo and increase the new ones.

 	We want to keep also the attached files the users removed thats why we don't put --delete in our rsync code. 


	2.Config
	src="/Users/user/Backup/from/*" 	= ORIGIN FOLDER
	dest="/Users/user/Backup/to"		= DESTINY FOLDER
	log="/Users/user/Backup/backup.log"	= BACKUP LOG
	user=$USER
	date=$(date +"%d-%m-%Y %T")


	3.Command

		rsync -t -r -v --progress --stats $src $dest >> $log



