#!/bin/bash

MYSQL_CONTAINER="my-mysql"
JOOMLA_CONTAINER="my-joomla"
BACKUP_SQL="my-joomla.backup.sql.gz"
FILES_BACKUP_DIR="./joomla-files-backup/html"

echo "📂 Restoring Joomla files..."
docker cp $FILES_BACKUP_DIR/. $JOOMLA_CONTAINER:/var/www/html/

echo "🔑 Restoring configuration.php..."
if [ -f "./joomla-files-backup/configuration.php" ]; then
  docker cp ./joomla-files-backup/configuration.php $JOOMLA_CONTAINER:/var/www/html/configuration.php
else
  echo "⚠️ Warning: configuration.php not found in backup!"
fi

echo "📥 Restoring database..."
gunzip < $BACKUP_SQL | docker exec -i $MYSQL_CONTAINER sh -c "exec mysql -uroot -pmy-secret-pw"

echo "🔁 Restarting Joomla..."
docker restart $JOOMLA_CONTAINER

echo "✅ Restore complete!"
