#!/bin/bash
#Backup script

#Config
src="/Users/user/Backup/from/*"
dest="/Users/user/Backup/to"
log="/Users/user/Backup/backup.log"
user=$USER
date=$(date +"%d-%m-%Y %T")

#Output on log file
echo "--- Start Backup" >> $log
echo "--- Source: $src" >> $log
echo "--- Dest  : $dest" >> $log
echo "--- $date by $user" >> $log
echo "---" >> $log

#Command
rsync -t -r -v --progress --stats $src $dest >> $log

#Output on log file
echo "---" >> $log
echo "--- End Backup" >> $log