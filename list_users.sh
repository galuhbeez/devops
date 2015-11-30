#!/bin/bash

host=192.168.1.127
#host2=192.168.1.13
#user=test-client2

ssh $host "

cd /home 
ls > /tmp/listusers1.txt
scp /tmp/listusers.txt test-client2@192.168.1.13:/home/test-client2/scripts/"




