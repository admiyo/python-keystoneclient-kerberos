#!/usr/bin/bash

#  This is the simplest test of Kerberos for a live server.
#  It is included here as a debugging tool.

# If the CA certificate for your server is not in the system defaults,
# replace ca.crt with the path to the proper CA certificate file.


if [ -z $OS_CA_CERT ]
then
	CERT_FLAG=--cacert $OS_CA_CERT
else
	CERT_FLAG=
fi


curl   \
-H "Content-Type:application/json" \
--negotiate -u : \
$CERT_FLAG \
-i \
-d  '{ "auth": { "identity": { "methods": ["kerberos"], "kerberos": {}}}}' \
-X POST $OS_AUTH_URL/auth/tokens 




