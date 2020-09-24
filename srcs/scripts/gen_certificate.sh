#generate a self signed key

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/server_key.pem -out /etc/ssl/certs/server_cert.pem -subj "/C=BE/ST=BRUSSELS/L=UCCLE/O=19school"
