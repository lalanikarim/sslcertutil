#!/bin/bash
if [ "$1" == "" ] || [ "$1" == "--help" ]; then
	echo "Usage: $0 <server-domain> [<cert-outfile.pem>]"
else
	if [ -d "/etc/letsencrypt/live/$1" ]; then
		PEMFILE="$1.pem"
		if [ "$2" != "" ]; then
			PEMFILE="$2"
		fi
		cat /etc/letsencrypt/live/$1/cert.pem /etc/letsencrypt/live/$1/privkey.pem > $PEMFILE
		echo "SSL certificate for $1 updated and stored to $PEMFILE"
	else
		echo "Unable to access /etc/letsencrypt/live/$1"
	fi
fi
