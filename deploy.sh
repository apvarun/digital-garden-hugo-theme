#!/bin/bash
hugo && rsync -avz --delete public/ root@45.63.19.189:/var/www/frizzande/ && ssh root@45.63.19.189 "systemctl restart nginx"

