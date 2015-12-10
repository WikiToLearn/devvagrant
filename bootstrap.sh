#!/bin/bash
sudo apt-get update
sudo apt-get install -y curl
sudo sh -c "curl -sSL get.docker.com | sh"
sudo adduser vagrant docker
