#!/bin/bash

echo "🔧 Creating Docker network 'mynetwork'..."
docker network create mynetwork

echo "🐬 Starting MySQL container 'my-mysql' with database and user setup..."
docker run -d \
  --name my-mysql \
  --network mynetwork \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  -e MYSQL_DATABASE=joomla_db \
  -e MYSQL_USER=demoadmin \
  -e MYSQL_PASSWORD=secretpassword \
  -p 3306:3306 \
  mysql:8.0

sleep 10

echo "🌐 Starting Joomla container 'my-joomla' and connecting it to MySQL..."
docker run -d \
  --name my-joomla \
  --network mynetwork \
  -e JOOMLA_DB_HOST=my-mysql \
  -e JOOMLA_DB_USER=demoadmin \
  -e JOOMLA_DB_PASSWORD=secretpassword \
  -e JOOMLA_DB_NAME=joomla_db \
  -p 8080:80 \
  joomla

echo "✅ Joomla and MySQL containers are up and running!"
echo "🔗 Access your Joomla site at: http://localhost:8080"
