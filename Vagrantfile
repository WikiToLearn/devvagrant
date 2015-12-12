Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
   vb.name = "wikitolearnbox"
  end

  config.vm.box = "debian/jessie64"
  config.vm.hostname = "wikitolearn.box"
  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provision :file do |file|
    file.source = "files/index.php"
    file.destination = "/var/www/html/index.php"
  end

  config.vm.provision :file do |file|
    file.source = "files/.htaccess"
    file.destination = "/var/www/html/.htaccess"
  end

  config.vm.provision :file do |file|
    file.source = "files/squid.conf"
    file.destination = "/etc/squid3/squid.conf"
  end

  config.vm.provision :file do |file|
    file.source = "files/proftpd.conf"
    file.destination = "/etc/proftpd/proftpd.conf"
  end

  # used for PAC
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  # used for squid
  config.vm.network "forwarded_port", guest: 3128, host: 3128
  # used for proftpd
  config.vm.network "forwarded_port", guest: 21, host: 2121, host_ip: "127.0.0.1"
  for i in 2122..2221
    config.vm.network "forwarded_port", guest: i, host: i, host_ip: "127.0.0.1"
  end

end
