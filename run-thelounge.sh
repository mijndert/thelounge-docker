#!/bin/bash
docker run -d --name thelounge -p 9000:9000 -P -e LOCAL_USER_ID=`id -u $USER` --restart=always -v ~/data:/var/opt/thelounge mijndert/thelounge-docker:latest
