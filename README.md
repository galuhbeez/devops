# devops 
tools for daily tasks 




freeradius.sh usage: script installs freeradius w/mysql and daloradius UI.  Conf file dependncies required.


ssh_user_create.sh Usage:
./ssh_user_create.sh remotehost ~/.ssh/id_rsa.pub remoteuser
./ssh_user_create.sh remoteadmin@remotehost /path/to/remoteuser/id_rsa.pub remoteuser

Sudo
You may need to run visudo and add to the bottom

youruser ALL=(ALL) NOPASSWD: ALL

setup-nat.sh usage:  Script used to provision an Ubuntu NAT Server
./setup-nat.sh "<nat_ip>" "<repo_name>"
