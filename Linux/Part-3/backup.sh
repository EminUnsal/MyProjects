#!/bin/bash

# Check if we are root privilage or not

if [[ $UID != 0 ]]; then
    echo "You don't have superuser privileges. Make sure to run script as root user."
    exit 1
fi
# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
 
backup_files="/home/ec2-user/data"

# Where do we backup to. Please crete this file before execute this script

destination="/mnt/backup"

# Create archive filename based on time

time=$(date +%Y_%m_%d_%I_%M_%p)
hostname=$(hostname -s)
archive_files="${hostname}-${time}.tgz"

# Print start status message.

echo "We will back up ${backup_files} to ${destination}/${archive_files}"
date
echo

# Backup the files using tar.
 # &> /dev/null (Bunu script birkaç kez calistirilip eklenebilir)
tar czf ${destination}/${archive_files} ${backup_files}
# Print end status message.
echo
echo "Congratulation, your backup is ready"
date
echo

# Long listing of files in $dest to check file sizes.
ls -lh ${destination}

#-------------
# /etc/crontab ın içine yazılacak

#crontab -e

#*/5 * * * * sudo /home/ec2-user/Third_Part/backup.sh

# Good article -> https://www.cumulations.com/blog/how-to-write-cron-jobs-on-amazon-web-servicesaws-ec2-server/

# To set this script for executing in every 5 minutes, we'll create cronjob

# vi or nano editor will open. We will run  backup.sh script in every 5 minutes. To be able to do this we'll write this within opend vi or nano file



# save and exit from nano or vi

# To check whether your Cron Jobs is saved or not, run the below command.


