#!/bin/bash
yum -y update
yum -y install wget
cd /usr/local/src
wget http://centos-webpanel.com/cwp-el7-latest
sh cwp-el7-latest
exit
