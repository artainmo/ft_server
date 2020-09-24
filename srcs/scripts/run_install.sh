#run a command on the image
apt-get update;

#Install NGINX, a server type (reverse proxy server, ...), -y confirms installation
apt-get install -y nginx;

#Install mysql through mariadb
apt-get install -y mariadb-server;

#install php for dynamic content
apt-get install -y php-fpm php-mysql php-mbstring openssl systemd
