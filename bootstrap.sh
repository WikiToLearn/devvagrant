#!/bin/bash
sudo apt-get update
sudo apt-get install -y curl
sudo sh -c "curl -sSL get.docker.com | sh"
sudo adduser vagrant docker
docker run -tid -p 8080:8080 -p 3128:3128 --name devproxy --net host wikitolearn/devproxy:0.1
