#!/bin/bash
if [ "$1" == "" ]; then
	echo "Usage: $0 <server-domain>"
else
	if [ -d "/etc/letsencrypt/live/$1" ]; then
		cat /etc/letsencrypt/live/$1/cert.pem /etc/letsencrypt/live/$1/privkey.pem > $1.pem
		echo "SSL certificate for $1 updated"
	else
		echo "Unable to access /etc/letsencrypt/live/$1"
	fi
fi
