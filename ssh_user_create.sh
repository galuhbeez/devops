remote_admin_host=$1
public_key=$2
user=$3
base_dir=$4
shell=/bin/bash

if [ "$base_dir" == "" ]
then

	base_dir="/home"

fi

ssh_folder="$base_dir/$user/.ssh" 

pk=$(cat $public_key)

ssh $remote_admin_host "

sudo useradd -m -b $base_dir -s $shell $user

sudo mkdir -p -m 777 $ssh_folder
echo "$pk" | sudo tee -a "$ssh_folder/authorized_keys" > /dev/null
sudo chown -R $user:$user $ssh_folder
sudo chmod 755 $ssh_folder
sudo chmod 644 "$ssh_folder/authorized_keys"
"
