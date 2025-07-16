#!/bin/bash

# Variables
CONTAINER_NAME="my-mysql"            # Name of the MySQL Docker container
BACKUP_FILE="my-joomla.backup.sql.gz" # Filename for the compressed database backup
JOOMLA_CONTAINER="my-joomla"          # Name of the Joomla Docker container
FILES_BACKUP_DIR="./joomla-files-backup" # Directory to store Joomla files backup

echo "Backing up the entire MySQL database inside container '$CONTAINER_NAME'..."
docker exec $CONTAINER_NAME sh -c "exec mysqldump --all-databases -uroot -pmy-secret-pw" | gzip > $BACKUP_FILE

echo "Backing up Joomla website files from container '$JOOMLA_CONTAINER'..."
docker cp $JOOMLA_CONTAINER:/var/www/html $FILES_BACKUP_DIR

echo "Backing up configuration.php..."
docker cp $JOOMLA_CONTAINER:/var/www/html/configuration.php $FILES_BACKUP_DIR/configuration.php


echo "Backup complete! Database saved to '$BACKUP_FILE' and files saved to directory '$FILES_BACKUP_DIR'."
