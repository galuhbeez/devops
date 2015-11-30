#!/bin/bash

#script set up NAT instance to provision cluster with ansible 

remote_admin_host=$1
git_repo=$2

scp /home/test-client2/Desktop/aws_inventory /home/test-client2/Desktop/mykey.pem test-client2@$remote_admin_host:/home/test-client2/ && 
ssh test-client2@$remote_admin_host "
sudo apt-get install git && 
sudo git clone $git_repo && 
sudo apt-get install software-properties-common && 
sudo apt-add-repository ppa:ansible/ansible && 
sudo apt-get update && 
sudo apt-get install ansible" 


