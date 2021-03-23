#!/bin/bash

#Delete the site; remove everything from the server, i.e containers, network, WordPress data and MariaDB data
sudo docker-compose down --volumes

    echo "example.com deleted successfully"
