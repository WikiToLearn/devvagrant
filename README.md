# WikiTolearn Develop Env in Vagrant

This is a vagrant file to create a local WikiToLearn local install in evry 64 bit vagrant compatible OS

### Installation

You need vagrant (https://docs.vagrantup.com/v2/installation/) and VirtualBox (https://www.virtualbox.org/).

Then you must download this repository at last commit and then use vagrant to start virtualbox machine

```
vagrant up
```

And then log in in the shell with vagrant command

```
vagrant ssh
```

The machine has a FTP server to semplify file transfer, the server is anonymous and is reachable with 127.0.0.1 address at 2121 port.

You have to configure your broswer to get proxy configuration file from http://127.0.0.1:8080

New you can follow this guide http://meta.wikitolearn.org/Guide_for_the_development_of_WikiToLearn/Run_WikiToLearn_locally

