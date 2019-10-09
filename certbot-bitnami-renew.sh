# This script is intented to run on Bitnami versions of Ubuntu Linux
# and aims to renew SSL certificates from certbot

# ****** SETP 1 ******
# Create a variable domain="YOUR-DOMAIN"

# ****** SETP 2 ******
# Create a variable email="YOUR-EMAIL-ADDRESS"

# ****** SETP 3 ******
# Execute this script with root PRIVILEGES

sudo /opt/bitnami/ctlscript.sh stop
sudo /opt/bitnami/letsencrypt/lego --tls --email="$email" --domains="$domain" --domains="www.$domain" --path="/opt/bitnami/letsencrypt" run
sudo mv /opt/bitnami/apache2/conf/server.crt /opt/bitnami/apache2/conf/server.crt.old
sudo mv /opt/bitnami/apache2/conf/server.key /opt/bitnami/apache2/conf/server.key.old
sudo mv /opt/bitnami/apache2/conf/server.csr /opt/bitnami/apache2/conf/server.csr.old
sudo ln -sf /opt/bitnami/letsencrypt/certificates/$domain.key /opt/bitnami/apache2/conf/server.key
sudo ln -sf /opt/bitnami/letsencrypt/certificates/$domain.crt /opt/bitnami/apache2/conf/server.crt
sudo chown root:root /opt/bitnami/apache2/conf/server*
sudo chmod 600 /opt/bitnami/apache2/conf/server*

sudo /opt/bitnami/ctlscript.sh stop

# ****** SETP 4 ******
# Be happy and Thankful
