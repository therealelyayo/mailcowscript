#!/usr/bin/env bash
apt update -y
apt upgrade -y
apt install curl nano git apt-transport-https ca-certificates gnupg2 software-properties-common -y
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
curl -L https://github.com/docker/compose/releases/download/$(curl -Ls https://www.servercow.de/docker-compose/latest.php)/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /opt
git clone https://github.com/mailcow/mailcow-dockerized
cd /opt/mailcow-dockerized
exit
