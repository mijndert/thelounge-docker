#!/bin/bash
docker run -d --name thelounge -p 9000:9000 -P -e PGID=1001 -e PUID=1001 --restart=always -v ~/data:/var/opt/thelounge mijndert/thelounge-docker:latest
