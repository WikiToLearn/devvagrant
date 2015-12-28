#!/bin/bash
if [[ $(id -u) -ne 0 ]] ; then
 sudo "$0"
 exit $?
fi
getent passwd vagrant &> /dev/null
if [[ $? -ne 0 ]] ; then
 echo "Missing vagrant user"
 exit 1
fi
echo root:vagrant | chpasswd
echo vagrant:vagrant | chpasswd

export DEBIAN_FRONTEND noninteractive
export DEBCONF_NONINTERACTIVE_SEEN true
grep non-free /etc/apt/sources.list || sed -i 's/main/main non-free contrib/g' /etc/apt/sources.list
apt-get update
apt-get dist-upgrade -y
apt-get install -y debconf-utils
echo -e 'proftpd-basic\tshared/proftpd/inetd_or_standalone\tselect\tstandalone' | debconf-set-selections
apt-get install -y curl squid3 apache2 php5 proftpd-basic virtualbox-guest-dkms sudo
docker info || curl -sSL get.docker.com | sh
adduser vagrant docker
rm /var/www/html/* -vf
a2enmod rewrite
grep 8080 /etc/apache2/ports.conf || sed -i 's/80/8080/g' /etc/apache2/ports.conf
grep 8080 /etc/apache2/sites-available/000-default.conf || sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf
sed -i 's/None/All/g' /etc/apache2/apache2.conf

cat files/index.php > /var/www/html/index.php
cat files/.htaccess > /var/www/html/.htaccess
cat files/squid.conf > /etc/squid3/squid.conf
cat files/proftpd.conf > /etc/proftpd/proftpd.conf
cat files/vagrantsudo > /etc/sudoers.d/vagrantsudo

mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
wget --no-check-certificate \
    https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
    -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
