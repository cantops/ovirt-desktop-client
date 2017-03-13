#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Syntax: $0 <fqdn> <file-to-save>"
  echo "fqdn: The fqdn of the oVirt engine instance (e.g.: ovirt.example.com)"
  echo "file-to-save: The file where to save the certificate"
  exit 1
fi

echo -n | openssl s_client -connect $1:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > $2
