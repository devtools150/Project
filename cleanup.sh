#!/bin/bash

echo "🧹 Starting cleanup of Joomla environment..."

echo "🚮 Removing Joomla container 'my-joomla' (stops and deletes the container)..."
docker rm -f my-joomla

echo "🚮 Removing MySQL container 'my-mysql' (stops and deletes the container)..."
docker rm -f my-mysql

echo "🚮 Removing Docker network 'mynetwork' (deletes the custom network)..."
docker network rm mynetwork

echo "✅ Cleanup finished! Note: Backup files were not deleted."
