# devops 
tools for daily tasks 




freeradius.sh usage: script installs freeradius w/mysql and daloradius UI.  Conf file dependncies required.


ssh_user_create.sh Usage:
./ssh_user_create.sh remotehost ~/.ssh/id_rsa.pub remoteuser
./ssh_user_create.sh remoteadmin@remotehost /path/to/remoteuser/id_rsa.pub remoteuser

Sudo
You may need to run visudo and add to the bottom

youruser ALL=(ALL) NOPASSWD: ALL

list_users.sh usage: lists users in 'home' directory on a remote server

<<<<<<< HEAD
setup-nat.sh usage:  Script used to provision an Ubuntu NAT Server
./setup-nat.sh "<nat_ip>" "<repo_name>

kim's bootie is rock solid
=======
ansibleinstall.sh usage:  Script install ansible on server

>>>>>>> 12fcfe8de6b8a3fce325fd5624f4244856e4ab5f
