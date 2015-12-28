Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
   vb.name = "wikitolearnbox"
  end

  config.vm.box = "debian/jessie64"
  config.vm.hostname = "wikitolearn.box"
  config.vm.box_url = ["http://download.wikitolearn.org/vagrant/localenv.box"]


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
