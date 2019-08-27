# This script is intented to run on Bitnami versions of Ubuntu Linux
# and aims to provide solve any inconvenience with the Wordpress
# folders

# ****** SETP 1 ******
# Execute this script

chown www-data:www-data  -R * # Let Apache/NGINX be owner
find . -type d -exec chmod 755 {} \;  # Change directory permissions rwxr-xr-x
find . -type f -exec chmod 644 {} \;  # Change file permissions rw-r--r--
