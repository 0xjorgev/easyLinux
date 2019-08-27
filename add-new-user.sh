# This script is intented to run on Bitnami versions of Ubuntu Linux
# and aims to provide access to users using login and password
# without the need for the .pem key

# ****** SETP 1 ******
# Create a variable newuser="YOUR-NEW-USERNAME"

# ****** SETP 2 ******
# Execute this script with root PRIVILEGES

sudo adduser $newuser #Add the new user
sudo cp -rp ~bitnami/.bashrc ~$newuser/ #Copy all the bash to the new user
sudo cp -rp ~bitnami/.profile ~$newuser/ #Copy all the profile to the new user
sudo chown -R $newuser:$newuser /home/$newuser/.ssh #Change ownership of the folders for the new user
sudo chmod 0700 /home/$newuser/.ssh #Change the permissions of the ssh for the new user
sudo chmod 0600 /home/$newuser/.ssh/authorized_keys #Change the permissions of the ssh keys for the new user

# Once done with this part of the process you shall run sudo vim /etc/ssh/sshd_config
# and look for PasswordAuthentication No and change it to
# PasswordAuthentication Yes then save the file and exit :wq

# ****** SETP 3 ******
# Change the sshd_config values

sudo vim /etc/ssh/sshd_config

# ****** SETP 4 ******
# Restart the SSH service

sudo service ssh restart
