# ATK Skeleton Project

This is the skeleton to get ready with the version 9.9.x of [Atk Framework](https://github.com/Sintattica/atk)

The following is a guide to bootstrap an atk project in `linux` systems. 

First install docker and docker-compose, and then proceed in the following way: 

In the project folder:
1. start all the containers (mysql, php, nginx) with: `docker-compose up` and wait for docker to download and install the images and compose to fire up the containers.
2. Install the php vendors with: `docker/console.sh composer-install`
3. Insert in the mysql container the skeleton database with: `docker/console.sh init-mysql-data`

If you arrived here it means docker has created and started 3 containers:
1. php: this image is the standard PHP7.2 installed from the provided `Dockerfile` and configured using the configuration files found in `docker/php/...`
2. mysql: this is a standard mysql server, it's configured using the `docker/mysql/config/my.cnf` and persists the database data locally in `docker/mysql/data`
3. nginx: standard nginx image configured using the files in `docker/nginx/config...`


Now if you navigate to `http://localhost:8080/` you should obtain the ATK Login page.
The default admin user is 'sintattica' and if `APP_ENV==dev` no password will be required to log in.

# 
#

#### Team Sintattica