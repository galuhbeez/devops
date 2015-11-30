# devops 
tools for daily tasks 

Usage:

ssh_user_create.sh
./ssh_user_create.sh remotehost ~/.ssh/id_rsa.pub remoteuser
./ssh_user_create.sh remoteadmin@remotehost /path/to/remoteuser/id_rsa.pub remoteuser

Sudo
You may need to run visudo and add to the bottom

youruser ALL=(ALL) NOPASSWD: ALL

setup-nat.sh
./setup-nat.sh "<nat_ip>" "<repo_name>"
