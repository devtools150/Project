#!/bin/bash

echo "Starting full cleanup of Joomla environment..."

echo "Removing Joomla container 'my-joomla'..."
docker rm -f my-joomla

echo "Removing MySQL container 'my-mysql'..."
docker rm -f my-mysql

echo "Removing Docker network 'mynetwork'..."
docker network rm mynetwork

echo "Removing backup files..."
rm -rf my-joomla.backup.sql.gz joomla-files-backup

echo "Moving up one level and removing 'Project' folder..."
cd ..
rm -rf Project

echo "Full cleanup finished!"
