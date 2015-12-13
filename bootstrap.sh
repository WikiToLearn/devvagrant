#!/bin/bash
export DEBIAN_FRONTEND noninteractive
export DEBCONF_NONINTERACTIVE_SEEN true
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y debconf-utils
echo -e 'proftpd-basic\tshared/proftpd/inetd_or_standalone\tselect\tstandalone' | debconf-set-selections
sudo apt-get install -y curl squid3 apache2 php5 proftpd-basic
sudo chmod 777 /var/www/html/
sudo chmod 777 /etc/squid3/
sudo chmod 777 /etc/squid3/*
sudo chmod 777 /etc/proftpd/
sudo chmod 777 /etc/proftpd/*
sudo sh -c "curl -sSL get.docker.com | sh"
sudo adduser vagrant docker
rm /var/www/html/* -vf
a2enmod rewrite
sed -i 's/80/8080/g' /etc/apache2/ports.conf
sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf
sed -i 's/None/All/g' /etc/apache2/apache2.conf

{
echo 'if [[ ! -f .restarted ]] ; then'
echo ' for s in proftpd apache2 squid3 ; do'
echo '  echo "Restarting "$s'
echo '  sudo systemctl restart $s'
echo ' done'
echo ' touch .restarted'
echo 'fi'
echo 'export W2L_SKIP_OCG_DOCKER=1'
} >> .bashrc
