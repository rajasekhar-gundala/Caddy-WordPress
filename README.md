# Caddy-Wordpress
Deploy WordPress Behind Caddy 2.3.0 using Docker Compose

> Clone the repository, git clone https://github.com/rajaseg/caddy-WordPress and cd caddy-WordPress go to Install step to setup WordPress

## Contents of the Repository
This repository contains WordPress application running behind Caddy, supported by Docker and orchestrated by Docker Compose.

It Includes:

A container for Caddy;\
A container for WordPress;\
A container for MariaDB;\
A container for Adminer;

## Pre-Requisites

> ```start-wordpress.sh``` script will install docker and docker compose if you don't have them on the server

If you want to proceed manually, make sure Docker and Docker Compose installed on the server where you are going to install the stack.

Make sure you created **caddyconfig**, **caddydata** and **caddylogs** folders in the drirectory where you have docker-compose file. ***Caddy's data directory is most important one, don't forget to persist it. If you forgot to persist, you will hit rate limit for getting Letsencrypt certificates.***

> Also create **wordpress** and **db** folders as well in the same directory to persist WordPress and MariaDB data.

If you are cloning the repository, then no need to create below files. or else ***Please make sure you have below secret files created in the directory***

wordpress_db_host.txt -->It should have db host name. Here it is db:3306 \
wordpress_db_user.txt -->It shoould have user name to log into db container. Here it is someuser \
wordpress_db_name.txt -->It shoould have database name for WordPress container. Here it is wordpress-user \
mysql_user.txt -->It should be same as wordpress_db_name.txt \
mysql_db_password.txt -->It shoould have password to connect and utilise wordpress database. Here it is somesecret \
wordpress_table_prefix.txt -->It shoould have table prefix for the databases for security purposes. Here it is sometext_ \
mysql_database.txt -->It shoould have database name for WordPress container. Here it is wordpress \
mysql_root_password.txt -->It shoould have user name to manage MariaDB container through Adminer. Here it is root 

## Install or Set up WordPress
> Please make sure to update ```your email``` and ```example.com``` in Caddyfile before proceeding to install WordPresss

> Also make sure that ```DNS entry (example.com)``` updated with ```IP``` of the server where you are installing the script

Clone or Download this repository. Once after getting the repository, there is a script file "start-wordpress.sh" if you want to automate whole process.

Change the file permission with 777

```sudo chmod 777 start-wordpress.sh```

Run the script with sudo.

```sudo ./start-wordpress.sh```

If you want to proceed manual process; please make sure pre-requisites installed to proceed further.

Once after getting the repository, use ```docker-compose up -d``` and wait for the containers to configure the WordPress site.

Open the domain, example.com in the web browser. Create an admin account and click the Install WordPress button.

> + You now have a working WordPress installation served using the Caddy web server. ***Caddy will automatically obtain SSL certificates from Let’s Encrypt, serve your site over a secure connection, and use HTTP/2 and Gzip compression to serve the website faster.***

> You can read more about Caddy and it's unique features, configuration directives for the Caddyfile in the official Caddy's website https://caddyserver.com/

## Manage MariaDB using Adminer
You can manage your MariaDB database using Adminer container that was included in the repository.

Open the web browser and enter dbadmin.example.com to open Adminer interface. Use root account and myswl_root_password to log into it.

## Stop the containers
Change the file permission with 777 for ```stop-wordpress.sh```

```sudo chmod 777 stop-wordpress.sh```

Run the script with sudo.

```sudo ./stop-wordpress.sh```

If you want to stop the containers manully...

Use command ```sudo docker-compose down``` to removes the containers, but preserves your WordPress database.

## Remove WordPress and Cleanup
Change the file permission with 777 for ```delete-wordpress.sh```

```sudo chmod 777 delete-wordpress.sh```

Run the script with sudo.

```sudo ./delete-wordpress.sh```

If you want to remove manully...

Use command ```sudo docker-compose down --volumes``` to remove everything from the server, i.e containers, network, WordPress data and MariaDB data.

